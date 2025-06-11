import Foundation

protocol CharactersUseCaseProtocol {
    var repo: CharactersRepositoryProtocol {get set}
    func getCharacters(filter:String) async -> [Hero]

}

final class CharactersUseCase:CharactersUseCaseProtocol {
    var repo: any CharactersRepositoryProtocol
    
    init(repo: CharactersRepositoryProtocol = CharactersRepository()) {
        self.repo = repo
    }
    
    func getCharacters(filter:String) async -> [Hero] {
        return await repo.getCharacters(filter: filter)
    }
    
    
}




final class CharactersUseCaseMock:CharactersUseCaseProtocol {
    var repo: any CharactersRepositoryProtocol
    
    init(repo: any CharactersRepositoryProtocol = CharactersRepositoryMock()) {
        self.repo = repo
    }
    
    func getCharacters(filter:String) async -> [Hero] {
        return await repo.getCharacters(filter: filter)
    }
    
    
}


