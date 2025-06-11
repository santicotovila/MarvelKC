import Foundation

protocol CharactersRepositoryProtocol {
    func getCharacters(filter:String) async -> [Hero]
}
