import Foundation


///Protocolo for the  useCase
protocol SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol { get set }
    func getSeriesForHero(id: Int) async -> [Series]
}


///Intermediate layer between repository and ViewModels, to manage the logic while maintaining a CLEAN architecture
final class SeriesForheroUseCase: SeriesUseCaseProtocol {
    
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = SeriesForHeroRepository()) {
        self.repo = repo
    }
    
    func getSeriesForHero(id: Int) async -> [Series] {
        await repo.getSeriesForHero(id: id)
    }
    
   
}

///Mock created for testing
final class SeriesForheroUseCaseMock: SeriesUseCaseProtocol {
    
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = SeriesForHeroRepositoryMock()) {
        self.repo = repo
    }
    
    func getSeriesForHero(id: Int) async -> [Series] {
        await repo.getSeriesForHero(id: id)
    }
    
   
}
