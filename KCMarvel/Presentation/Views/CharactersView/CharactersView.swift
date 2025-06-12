import Foundation
import SwiftUI

///We receive the hero with its respective ID and access SeriesView with its value, representing the cells as we have configured in CharacterRow.

struct CharactersView: View {
    
      var viewModel: CharactersViewModel
    
    var body: some View {
        NavigationStack{
            
            ScrollView{
                VStack{
                    ForEach(viewModel.heros, id: \.id) { hero in
                        NavigationLink {
                            SeriesView(viewModel: SeriesViewModel(useCase: SeriesForheroUseCase(), hero: hero))
                        } label: {
                            CharacterRow(hero: hero)
                        }
                    }
                }
            }.navigationBarBackButtonHidden(true)///We hide the possibility of returning so that the user cannot go back to the Home page
            
        }
    }
}


#Preview {
    CharactersView(viewModel: CharactersViewModel())
}




