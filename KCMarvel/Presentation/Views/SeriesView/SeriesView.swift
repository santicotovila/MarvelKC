import SwiftUI
///We create the View to pass the custom row with its respective id and if we do not have series we give feedback to the user
struct SeriesView: View {
    
    var viewModel: SeriesViewModel
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                if viewModel.seriesHero.isEmpty {
                    Text("No series found")
                }
                else {
                    ForEach(viewModel.seriesHero,id:\.id) {serie in
                        SeriesRowView(series: serie)
                    }
                }
            }
            
        }
    }
}


