
import SwiftUI

struct SeriesRowView: View {
    
     
    let series: Series
    
    var body: some View {
        AsyncImage(url:URL(string:series.thumbnail.fullURL)) { img in
            if let image = img.image {
                ZStack {
                    image
                        .resizable()
                        .opacity(0.7)
                        .aspectRatio(contentMode: .fill)
                        
                    
                    Image(decorative: "")
                        .resizable()
                        .background(Color.black.opacity(0.6))
                    
                    VStack(alignment: .leading) {
                        Text("\(series.title)")
                            .font(.system(size: 22))
                            .shadow(radius: 10)
                            .foregroundStyle(.white)
                            .bold()
                            .padding()
                        
                        if let description = series.description {
                            Text("\(description)")
                                .font(.system(size: 16))
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.horizontal)
                        }
                        
                        
                    }
                }
                
                
            }
                
            
        }
   
    }
}

#Preview {
    SeriesRowView(series: Series(id: 1, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668", extension: "jpg"),title: "Titleeeeee",description: "description"))
}
