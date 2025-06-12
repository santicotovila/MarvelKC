import Foundation

///Protocols created for network calls in NetworkMarvel
protocol NetworkMarvelProtocol {
    func getCharacters () async -> [Hero]
    func getSeriesForHero (id:Int) async -> [Series]
}


///Structure for network calls, both to obtain the characters and to obtain the series of them, I use Components to create the network call in a safe and orderly manner.
///I have not created the body in the call since we are working with GET
final class NetworkMarvel: NetworkMarvelProtocol {
    
    func getCharacters() async -> [Hero] {
        let url: String = "\(ConstantsApp.URL_API)\(EndPoints.characters)"
        var components = URLComponents(string: url)
        components?.queryItems = SecurityAccess().AuthorizationAccess()
        guard let fullUrl = components?.url else { return [] }
        var request = URLRequest(url:fullUrl)
        request.httpMethod = HttpMethods.GET.rawValue
        
        ///I attempt the call and decode the JSON. Otherwise, we capture it in the catch function, providing information in the debug. I've managed both calls with generics to make the decoding cleaner, using the same code.
        ///I have not created the body in the call since we are working with GET
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HTTPResponseCodes.SUCESS.rawValue {
                let decode = try JSONDecoder().decode(ResponseMarvel<Hero>.self, from: data)
                    return decode.data.results
                }
            }
        }
        
        catch {
            NSLog("Error al decodificar \(error.localizedDescription)")
            NSLog("Error getting data")
            
        }
        ///We return an empty list of characters if we get no data.
        return []
       
        
    }
    
    ///I do the same process as for obtaining heroes
    func getSeriesForHero(id: Int) async -> [Series] {
        let url: String = "\(ConstantsApp.URL_API)\(EndPoints.seriesForHero(id: id))"
        var components = URLComponents(string: url)
        components?.queryItems = SecurityAccess().AuthorizationAccess()
        guard let fullURL = components?.url else { return [] }
        var request = URLRequest(url:fullURL)
        request.httpMethod = HttpMethods.GET.rawValue
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HTTPResponseCodes.SUCESS.rawValue {
                    let decode = try JSONDecoder().decode(ResponseMarvel<Series>.self, from: data)
                    return decode.data.results
                    
                }
            }
        }
        catch {
            NSLog("Error getting data")
            
        }
        
        ///We return an empty list of characters if we get no data.
        return []
        
    }
    
}


///The creation of this mock has been to test our call locally and thus not make real network calls and for testing
final class NetworkMarvelMock: NetworkMarvelProtocol {
    ///Mock for obtaining characters
    func getCharacters() async -> [Hero] {
        let Thumbnail1 = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668", extension: ".jpg")
        
        let model1 = Hero(id: 1, name: "Spider", description: "description", thumbnail: Thumbnail1, resourceURI: "resourceURI")
        
        let Thumbnail2 = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668", extension: ".jpg")
        
        let model2 = Hero(id: 2, name: "ironMan", description: "description2", thumbnail: Thumbnail2, resourceURI: "")
        return [model1,model2]
        
    }
    
    ///Mock for obtaining series
    func getSeriesForHero(id:Int) async -> [Series] {
        let Thumbnail1 = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668", extension: ".jpg")
        let model1 = Series(id: 1, thumbnail: Thumbnail1, title: "titleHero", description: "description")
        
        let Thumbnail2 = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668", extension: ".jpg")
        let model2 = Series(id: 2, thumbnail: Thumbnail2, title: "titleHero2", description: "description2")
        
        return [model1,model2]
    }
    
}

