
import Foundation


enum HTTPResponseCodes: Int {
    case SUCESS = 200
    case SUCCESS_CREATED = 201
    case NOTAUTHERIZED = 401
    case FORBIDDEN = 403
    case METHOD_NOT_ALLOWED = 405
    case MISSING_API_KEY = 409 /// Es similar para Missing API Key,Missing Hash,Missing Timestamp
    
}

