import Foundation
import CryptoKit


//FIXME: - Como en clase has mencionado CryptoKit para darle seguridad y no dejar informacion valiosa de acceso libre en la app he optado por buscar algo de información sobre ello y he implementado CryptoKit para darle mayor seguridad al hash,gestionandolo directamente en la propia app y no dejandolo creado en el proyecto,supongo que aún asi no es seguridad suficiente ya que las claves(tanto privada como pública) quedan expuestas en el archivo,te agradezco si me  solucionas la duda de lo que debería implementar a más...😅

struct ConstantsApp {
    static let URL_API = "https://gateway.marvel.com"
    static let PUBLICKEY = "3894dffe2cd29353d59a06b4ed76d02f"
    static let PRIVATEKEY = "0ddcbdf9b2fe931474b0b3500831b9a35c9ccabb"
    
}



struct SecurityAccess {
    
    func AuthorizationAccess() -> [URLQueryItem] {
        let ts = "\(Date().timeIntervalSince1970)" /// Generamos un ts distinto para dar mayor seguridad en cda llamada
        let hash = (ts + ConstantsApp.PRIVATEKEY + ConstantsApp.PUBLICKEY).md5
        return [
            URLQueryItem(name: "ts",value: ts),
            URLQueryItem(name: "apikey",value: ConstantsApp.PUBLICKEY),
            URLQueryItem(name:"hash",value: hash)
        ]
    }
  
}

extension String {
    var md5: String {
        let digest = Insecure.MD5.hash(data: Data(self.utf8))
        return digest.map{String(format: "%02hhx",$0)}.joined()
    }
}


