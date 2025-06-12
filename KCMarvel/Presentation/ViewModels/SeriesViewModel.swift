import Foundation

@Observable
final class SeriesViewModel {
    
    var seriesHero = [Series]()
    var hero: Hero
    
    @ObservationIgnored
    private let useCase: SeriesUseCaseProtocol
    
    init(useCase: SeriesUseCaseProtocol,hero:Hero) {
        self.useCase = useCase
        self.hero = hero
        
       Task {
            
           await getSeriesForHero(id: hero.id)
        }
        
    }
    
    @MainActor
    func getSeriesForHero(id: Int) async {
        
        let dataHero = await useCase.getSeriesForHero(id: id)
        self.seriesHero = dataHero
        
    
    }
    
    
    
}
