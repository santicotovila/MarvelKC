import Foundation

///Creation of this intermediate layer between Data and Domain to carry out a CLEAN architecture, created to obtain Marvel characters.
///Network variable created as private so that it is inaccessible outside the same class.
final class CharactersRepository: CharactersRepositoryProtocol {
 
    private var network: NetworkMarvelProtocol
    
    init(network: NetworkMarvelProtocol = NetworkMarvel()) {
        self.network = network
    }
    
    func getCharacters(filter:String) async -> [Hero] {
        return await network.getCharacters()
    }
    

}

///This mockup was created both to work on the project locally and to test that the repository layer works correctly.
///Network variable created as private so that it is inaccessible outside the same class.
final class CharactersRepositoryMock: CharactersRepositoryProtocol {

    private var network: NetworkMarvelProtocol
    
    init(network: NetworkMarvelProtocol = NetworkMarvelMock()) {
        self.network = network
    }
    
    func getCharacters(filter:String) async -> [Hero] {
        return await network.getCharacters()
    }
    
}


