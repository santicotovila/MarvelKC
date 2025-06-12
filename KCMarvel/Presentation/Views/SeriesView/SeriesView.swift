import SwiftUI

struct SeriesView: View {
    
    var viewModel: SeriesViewModel
    var hero: Hero
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                ForEach(viewModel.seriesHero,id: \.id) {serie in
                    SeriesRowView(series: serie)
                }
            }
            .onAppear {
                Task{
                    await viewModel.getSeriesForHero(filter: hero.id)
                }
            }
        }
    }
}

