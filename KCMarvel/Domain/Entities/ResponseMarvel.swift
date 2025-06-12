import Foundation


///Structure required for data decoding, I have worked with generics to be able to recycle the code for both characters and series

struct ResponseMarvel<T: Codable>: Codable {
    let data: DataMarvel<T>
}

struct DataMarvel<T: Codable>: Codable {
    let results: [T]
}
