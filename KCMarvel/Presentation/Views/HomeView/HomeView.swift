
import SwiftUI
///HomeView is the main screen where I give the user a welcome and a waiting time so they can download while the heroes
///The creation of the variables animateLoading and navigationNextView have been created to manage both the animation and to inform when to move to the next window (as soon as three seconds have passed and it becomes true)
struct HomeView: View {
    var charactersVM = CharactersViewModel()
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
                
                Image(decorative: "") //FIXME: - Realmente en clase enseñaste esta manera para darle oscurecer un poco el background pero el problema es que al añadir el decorative con "" me genera warnings porque no me encuentra la imagen y no se si habría alguna alternativa mejor.
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
                                //FIXME: - He probado a cargar los heroes desde aquí, aprovechando los tres segundos de espera para así mejorar la experiencia de usuario llegando a la siguiente View con los heroes cargados ya que cargan con lag pero no ha servido y por eso lo he quitado y me ha dejado algo confuso preguntandome cual sería la mejor solución para el problema.
                                
                               /* Task {
                                    await charactersVM.getCharacters()
                                }*/
                                    
                                    animateLoading = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        navegationNextView = true
                                    }
                                }
                                }
                                
                            }
                            .navigationDestination(isPresented: $navegationNextView) {
                                CharactersView(viewModel:charactersVM)
                            }
                            

                    }
                    
                }
                                
            }

            
        }
        
    



