import Foundation

protocol SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol { get set }
    func getSeriesForHero(id: Int) async -> [Series]
}



final class SeriesForheroUseCase: SeriesUseCaseProtocol {
    
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = SeriesForHeroRepository()) {
        self.repo = repo
    }
    
    func getSeriesForHero(id: Int) async -> [Series] {
        await repo.getSeriesForHero(id: id)
    }
    
   
}


final class SeriesForheroUseCaseMock: SeriesUseCaseProtocol {
    
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = SeriesForHeroRepositoryMock()) {
        self.repo = repo
    }
    
    func getSeriesForHero(id: Int) async -> [Series] {
        await repo.getSeriesForHero(id: id)
    }
    
   
}
