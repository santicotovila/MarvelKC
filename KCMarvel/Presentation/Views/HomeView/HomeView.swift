
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
                
                Rectangle()
                    .fill(Color.black.opacity(0.7))
                    .ignoresSafeArea()

                
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
                                }
                                
                            }
                            .navigationDestination(isPresented: $navegationNextView) {
                                CharactersView(viewModel:charactersVM)
                            }
                            

                    }
                    
                }
                                
            }

            
        }
        
    



