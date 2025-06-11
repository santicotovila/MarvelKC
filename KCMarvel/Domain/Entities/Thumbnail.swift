import Foundation

///Support images Marvel

struct Thumbnail: Codable {
    var path: String
    var `extension`: String
    
    //He creado una variable computada porque estaba teniendo problemas para obtener la url de la imagen y lo mas sencillo me parecío juntar el path y extension y pasarlo a String para trabajar mas comodo.
    var fullURL:String {
        return "\(path).\(`extension`)"
    }
}

