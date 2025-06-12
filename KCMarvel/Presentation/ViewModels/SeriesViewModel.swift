import Foundation

///Using viewModel with Observable to listen for changes to its properties.
@Observable
final class SeriesViewModel {
    
    var seriesHero = [Series]()
    var hero: Hero
    
    ///Use ObservationIgnored to make the property not listened to.
    @ObservationIgnored
    private let useCase: SeriesUseCaseProtocol
    
    init(useCase: SeriesUseCaseProtocol,hero:Hero) {
        self.useCase = useCase
        self.hero = hero
        
        ///Execute the heroes loading asynchronously in the init
       Task {
            
           await getSeriesForHero(id: hero.id)
        }
        
    }
    
    ///We give the heroes property the information received by network or we use the @MainActor so that it runs in the main thread since we have to update the UI
    @MainActor
    func getSeriesForHero(id: Int) async {
        
        let dataHero = await useCase.getSeriesForHero(id: id)
        self.seriesHero = dataHero
        
    
    }
    
    
    
}
