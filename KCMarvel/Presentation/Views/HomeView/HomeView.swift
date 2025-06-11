
import SwiftUI

struct HomeView: View {
    
    @State private var animateLoading = false
    @State private var navegationNextView = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Image(.marvelUniverse)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .opacity(0.7)
                
                Image(decorative:"") //FIXME: - Realmente en clase enseñaste esta manera para darle oscurecer un poco el background pero el problema es que al añadir el decorative con "" me genera warnings porque no me encuentra la imagen y no se si habria alguna alternativa para evitarlos sin tener que buscar y añador una imagen negra al asserts
                    .resizable()
                    .background(.black.opacity(0.7))
                
                
                VStack {
                    Text("Loading...")
                        .foregroundStyle(.white)
                        .bold()
                        .padding(10)
                    
                    ZStack {
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .frame(width:280,height: 6)
                        
                        Capsule()
                            .fill(Color.blue)
                            .frame(width: 60,height: 6)
                            .offset(x:animateLoading ? 110 : -110)
                            .animation(.linear(duration: 2).repeatForever(),value: animateLoading)
                    
                            .onAppear{
                                animateLoading = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    navegationNextView = true
                                }
                                
                            }
                            .navigationDestination(isPresented: $navegationNextView) {
                                CharactersView(viewModel: CharactersViewModel())
                            }
                            

                    }
                    
                }//Vstack
                                
            }

            
        }//navigationStack
        
    }
}
#Preview {
    HomeView()
}

