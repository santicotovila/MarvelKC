import Foundation

protocol NetworkMarvelProtocol {
    func getCharacters () async -> [Hero]
    func getSeriesForHero (id:Int) async -> [Series]
}



final class NetworkMarvel: NetworkMarvelProtocol {
    
    func getCharacters() async -> [Hero] {
        let url: String = "\(ConstantsApp.URL_API)\(EndPoints.characters)"
        var components = URLComponents(string: url)
        components?.queryItems = SecurityAccess().AuthorizationAccess()
        guard let fullUrl = components?.url else { return [] }
        var request = URLRequest(url:fullUrl)
        request.httpMethod = HttpMethods.GET.rawValue
        
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
        return []
       
        
    }
    
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
        return []
        
    }
    
}


//TODO: - Revisar
final class NetworkMarvelMock: NetworkMarvelProtocol {
    func getCharacters() async -> [Hero] {
        let Thumbnail1 = Thumbnail(path: "https://www.salvat.com/img/cms/MARVEL%20MUGS/bodegon-marvel633x608", extension: ".png")
        
        let model1 = Hero(id: 1, name: "", description: "", thumbnail: Thumbnail1, resourceURI: "")
        
        let Thumbnail2 = Thumbnail(path: "https://www.salvat.com/img/cms/MARVEL%20MUGS/bodegon-marvel633x608", extension: ".png")
        
        let model2 = Hero(id: 1, name: "", description: "", thumbnail: Thumbnail2, resourceURI: "")
        return [model1,model2]
        
    }
    
    func getSeriesForHero(id:Int) async -> [Series] {
        return []
    }
    
}

