import Foundation

struct EndPoints {
    static let characters = "/v1/public/characters"
    static func seriesForHero(id: Int) -> String {
        return "/v1/public/characters/\(id)/series"
    }
   
}
