
import SwiftUI

struct CharacterRow: View {
    let hero: Hero
    var body: some View {
        AsyncImage(url: URL(string:hero.thumbnail.fullURL)) { image in
            if let img = image.image {
                img
                    .resizable()
                    .frame(width: 370, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(5)
                
                Text("\(hero.name)")
                    .font(.system(size: 18))
                    .foregroundStyle(.black)
                    .bold()
                
            }
        }
    }
}


