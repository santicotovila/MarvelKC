import Foundation

///Protocolo for the  useCase
protocol CharactersUseCaseProtocol {
    var repo: CharactersRepositoryProtocol {get set}
    func getCharacters(filter:String) async -> [Hero]

}
///Intermediate layer between repository and ViewModels, to manage the logic while maintaining a CLEAN architecture
final class CharactersUseCase:CharactersUseCaseProtocol {
    var repo: any CharactersRepositoryProtocol
    
    init(repo: CharactersRepositoryProtocol = CharactersRepository()) {
        self.repo = repo
    }
    
    func getCharacters(filter:String) async -> [Hero] {
        return await repo.getCharacters(filter: filter)
    }
    
    
}



///Mock created for testing
final class CharactersUseCaseMock:CharactersUseCaseProtocol {
    var repo: any CharactersRepositoryProtocol
    
    init(repo: any CharactersRepositoryProtocol = CharactersRepositoryMock()) {
        self.repo = repo
    }
    
    func getCharacters(filter:String) async -> [Hero] {
        return await repo.getCharacters(filter: filter)
    }
    
    
}


