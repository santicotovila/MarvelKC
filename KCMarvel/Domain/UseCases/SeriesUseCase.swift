import Foundation

protocol SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol { get set }
    func getSeriesForHero(filter: String) async -> [Series]
}



final class SeriesForheroUseCase: SeriesUseCaseProtocol {
    
    var repo: SeriesRepositoryProtocol
    
    init(repo: SeriesRepositoryProtocol = SeriesForHeroRepository()) {
        self.repo = repo
    }
    
    func getSeriesForHero(filter: String) async -> [Series] {
        await repo.getSeriesForHero(filter: filter)
    }
    
   
}


