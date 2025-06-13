
import SwiftUI

///Here we manage the row of each series, keeping the customization independent from the general view.

struct SeriesRowView: View {
    let series: Series
    
    var body: some View {
        
        ZStack {
            
            AsyncImage(url: URL(string: series.thumbnail.fullURL)) { img in
                if let image = img.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                    
                }
            }
            
            Image(decorative: "")
                .resizable()
                .background(Color.black.opacity(0.6))
                .frame(height: 300)
            
            VStack(alignment: .leading) {
                Text(series.title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                
                ScrollView {
                    if let description = series.description { ///We unpack because it is optional since not all of them have a description
                    Text(description)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .frame(height: 200)
                }
                }
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
        
    }
    
}

#Preview {
    SeriesRowView(series: Series(id: 1, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668", extension: "jpg"),title: "Titleeeeee",description: "description"))
}

