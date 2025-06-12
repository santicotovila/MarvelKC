
import SwiftUI

struct SeriesRowView: View {
    
     
    let series: Series
    
    var body: some View {
        AsyncImage(url:URL(string:series.thumbnail.fullURL)) { img in
            if let image = img.image {
                ZStack {
                    image
                        .resizable()
                        .frame(width: 370,height: 200)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                }
            }
                Text("\(series.title)")
            
        }
    }
}
