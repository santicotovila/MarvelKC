import Foundation

@Observable
final class SeriesViewModel {
    
    var seriesHero = [Series]()
    
    
    @ObservationIgnored
    private let useCase: SeriesForheroUseCase
    
    init(useCase: SeriesForheroUseCase) {
        self.useCase = useCase
        
        Task {
            
            await getSeriesForHero()
        }
        
    }
    
    @MainActor
    func getSeriesForHero(filter: Int = 0) async {
        
        let dataHero = await useCase.getSeriesForHero(filter: filter)
        self.seriesHero = dataHero
        
    
    }
    
    
    
}
