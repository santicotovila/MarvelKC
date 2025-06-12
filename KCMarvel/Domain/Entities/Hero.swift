import Foundation

///Structure created to receive the heroes, Codable for decoding
struct Hero: Codable, Identifiable {
    let id: Int
    let name, description: String
    var thumbnail: Thumbnail
    let resourceURI: String
}
