import SwiftUI
///Creating the View to pass the custom row with its respective id and we execute the method to obtain the series when the view is going to appear
struct SeriesView: View {
    
     var viewModel: SeriesViewModel
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                ForEach(viewModel.seriesHero,id:\.id) {serie in
                    SeriesRowView(series: serie)
                }
            }
            .onAppear {
                Task{
                    await viewModel.getSeriesForHero(id:viewModel.hero.id)
                }
            }
        }
    }
}

