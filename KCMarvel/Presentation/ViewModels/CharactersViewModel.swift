import Foundation

///Using viewModel with Observable to listen for changes to its properties.
@Observable
final class CharactersViewModel {
     var heros = [Hero]()
    
    ///Use ObservationIgnored to make the property not listened to.
@ObservationIgnored
    private var useCaseCharacters: CharactersUseCaseProtocol

    init(useCaseCharacters:CharactersUseCaseProtocol = CharactersUseCase() ){
        self.useCaseCharacters = useCaseCharacters
        
        ///Execute the heroes loading asynchronously in the init
        Task {
            await self.getCharacters()
        }
        
    }
   
    ///We give the heroes property the information received by network or we use the @MainActor so that it runs in the main thread since we have to update the UI
    @MainActor
    func getCharacters(filterHero:String = "") async {
        let dataCharacters = await useCaseCharacters.getCharacters(filter: filterHero)
        self.heros = dataCharacters
    }
    
}
