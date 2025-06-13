
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
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 380, height: 250)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    
                    Image(decorative: "")
                        .resizable()
                        .background(Color.black.opacity(0.5))
                        .frame(height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                      
                    Text("\(hero.name)")
                        .font(.system(size: 24,weight: .bold))
                        .foregroundStyle(.white)
                        .padding()
                }
                .frame(width: 380, height: 250)
            }
            
            ///In case the images are not loaded yet, we present a ProgressView to give feedback to the user.
            else {
                ProgressView()
                    .frame(width: 380,height: 250)
            }
        }
    }
}

#Preview {
   let tum =  Thumbnail.init(path: "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668", extension: "jpg")
    let hero = Hero(id: 1, name: "name", description: "", thumbnail: tum, resourceURI: "")
    CharacterRow(hero: hero)
}
