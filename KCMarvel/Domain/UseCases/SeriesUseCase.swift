import Foundation

protocol SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol { get set }
    func getSeriesForHero(filter: Int) async -> [Series]
}



final class SeriesForheroUseCase: SeriesUseCaseProtocol {
    
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = SeriesForHeroRepository()) {
        self.repo = repo
    }
    
    func getSeriesForHero(filter: Int) async -> [Series] {
        await repo.getSeriesForHero(filter: filter)
    }
    
   
}


final class SeriesForheroUseCaseMock: SeriesUseCaseProtocol {
    
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = SeriesForHeroRepositoryMock()) {
        self.repo = repo
    }
    
    func getSeriesForHero(filter: Int) async -> [Series] {
        await repo.getSeriesForHero(filter: filter)
    }
    
   
}
