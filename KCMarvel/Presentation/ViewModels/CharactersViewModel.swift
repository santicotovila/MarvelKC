import Foundation

@Observable
final class CharactersViewModel {
     var heros = [Hero]()
    
@ObservationIgnored
    private var useCaseCharacters: CharactersUseCaseProtocol

    init(useCaseCharacters:CharactersUseCaseProtocol = CharactersUseCase() ){
        self.useCaseCharacters = useCaseCharacters
        
        Task {
            await self.getCharacters()
        }
        
    }
   
    
    @MainActor
    func getCharacters(filterHero:String = "") async {
        let dataCharacters = await useCaseCharacters.getCharacters(filter: filterHero)
        self.heros = dataCharacters
    }
    
}
