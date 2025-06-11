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
                    ForEach(viewModel.heros, id: \.id) { hero in
                        NavigationLink {
                            SeriesView(hero: hero)
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




