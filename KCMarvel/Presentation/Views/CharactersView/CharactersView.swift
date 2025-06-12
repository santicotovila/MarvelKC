import Foundation
import SwiftUI

struct CharactersView: View {
    
  
    @State var viewModel: CharactersViewModel
    @State var searchhero: String = ""
    //TODO: - Revisar
    
    var body: some View {
        NavigationStack{
            
            ScrollView{
                VStack{
                    //TODO: - Revisar
                    ForEach(viewModel.heros, id: \.id) { hero in
                        NavigationLink {
                            SeriesView(viewModel: SeriesViewModel(useCase: SeriesForheroUseCase(), hero: hero))
                        } label: {
                            CharacterRow(hero: hero)
                        }
                    }
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    CharactersView(viewModel: CharactersViewModel())
}




