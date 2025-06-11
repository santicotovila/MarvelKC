import Foundation


//Lo he hecho generico para poder usar tanto para heroes como para las series.

struct ResponseMarvel<T: Codable>: Codable {
    let data: DataMarvel<T>
}

struct DataMarvel<T: Codable>: Codable {
    let results: [T]
}
