import Foundation

///Support to receive the Marvel images since the JSON comes with the path and its separate format

struct Thumbnail: Codable {
    var path: String
    var `extension`: String
    
    ///I created a computed variable because I was having trouble getting the image URL and the easiest thing to do seemed to me to combine the path and extension and convert it to String to work more comfortably.
    var fullURL:String {
        return "\(path).\(`extension`)"
    }
}

