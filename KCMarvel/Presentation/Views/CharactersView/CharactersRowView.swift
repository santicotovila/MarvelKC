
import SwiftUI

struct CharacterRow: View {
    let hero: Hero
    var body: some View {
        AsyncImage(url: URL(string:hero.thumbnail.fullURL)) { image in
            if let img = image.image {
                ZStack(alignment: .bottomLeading) {
                    img
                    .resizable()
                    .frame(width: 380, height: 250)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    
                    Image(decorative: "")
                        .resizable()
                        .frame(width: 380, height: 250)
                        .background(Color.black.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        
                    
                    VStack {
                        Text("\(hero.name)")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                            .padding()
                        
                    }
                }
            }
        }
    }
}

#Preview {
   let tum =  Thumbnail.init(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668", extension: "jpg")
    let hero = Hero(id: 1, name: "name", description: "", thumbnail: tum, resourceURI: "")
    CharacterRow(hero: hero)
}
