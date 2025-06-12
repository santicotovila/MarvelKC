import Foundation

///Structure created for the endpoints, as we need for the series of the desired user, I have created a function so that in this way I can create the complete URL, assigning the series to the hero, address provided in the original Marvel documentation.
struct EndPoints {
    static let characters = "/v1/public/characters"
    static func seriesForHero(id: Int) -> String {
        return "/v1/public/characters/\(id)/series"
    }
   
}
