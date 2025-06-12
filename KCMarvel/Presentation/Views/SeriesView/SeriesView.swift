import SwiftUI

struct SeriesView: View {
    
    @State  var viewModel: SeriesViewModel
    
    
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

