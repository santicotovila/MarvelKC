import Foundation

final class CharactersRepository: CharactersRepositoryProtocol {
 
    private var network: NetworkMarvelProtocol
    
    init(network: NetworkMarvelProtocol = NetworkMarvel()) {
        self.network = network
    }
    
    func getCharacters(filter:String) async -> [Hero] {
        return await network.getCharacters()
    }
    

}


final class CharactersRepositoryMock: CharactersRepositoryProtocol {
 
    private var network: NetworkMarvelProtocol
    
    init(network: NetworkMarvelProtocol = NetworkMarvelMock()) {
        self.network = network
    }
    
    func getCharacters(filter:String) async -> [Hero] {
        return await network.getCharacters()
    }
    
}


