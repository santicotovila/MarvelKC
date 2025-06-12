import Foundation

///Structure created to receive the series, Codable for decoding
struct Series: Codable {
    let id: Int
    let thumbnail: Thumbnail
    let title: String
    let description: String?
}
