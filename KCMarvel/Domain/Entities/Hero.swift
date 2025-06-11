import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let name, description: String
    var thumbnail: Thumbnail
    let resourceURI: String
}
