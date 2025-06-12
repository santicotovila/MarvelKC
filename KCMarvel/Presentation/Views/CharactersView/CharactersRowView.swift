
import SwiftUI

///Creating this structure for everything that each section of the hero entails, we check during image unpacking that what we receive is actually a valid image and we customize it, accompanied by its respective name.
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
                        .background(Color.black.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                        
                    
                    VStack {
                        Text("\(hero.name)")
                            .font(.system(size: 26))
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
