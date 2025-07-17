import Foundation
import CryptoKit



///The creation of this struct was to provide the different addresses necessary for network calls.
struct ConstantsApp {
    static let URL_API = "https://gateway.marvel.com"
    static let PUBLICKEY = "489f263b000e9b7f742f36449b85e2ac"
    static let PRIVATEKEY = "65c5efc78ce0704160a3c16523b78dc0e2d9dff7"
    
}


///I have chosen to create this structure to provide greater security to the project using the Cryptokit framework, which allows me in this case to manage the hash with md5 in the same project and thus avoid leaving it visible.
struct SecurityAccess {
    
    func AuthorizationAccess() -> [URLQueryItem] {
        let ts = "\(Date().timeIntervalSince1970)" ///Automatically generates a random text message for greater security and to avoid always using the same one for each call.
        let hash = (ts + ConstantsApp.PRIVATEKEY + ConstantsApp.PUBLICKEY).md5
        return [
            URLQueryItem(name: "ts",value: ts),
            URLQueryItem(name: "apikey",value: ConstantsApp.PUBLICKEY),
            URLQueryItem(name:"hash",value: hash)
        ]
    }
  
}

///This computed variable is where the MD5 hash is generated for use in SecurityAccess
extension String {
    var md5: String {
        let digest = Insecure.MD5.hash(data: Data(self.utf8))
        return digest.map{String(format: "%02hhx",$0)}.joined()
    }
}


