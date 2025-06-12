import Foundation

///Protocol for Characters
protocol CharactersRepositoryProtocol {
    func getCharacters(filter:String) async -> [Hero]
}
