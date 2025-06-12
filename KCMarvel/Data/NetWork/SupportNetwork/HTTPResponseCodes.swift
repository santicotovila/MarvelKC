
import Foundation

///These are all the different response codes, it is necessary to mention that the 409 response is similar for Missing API Key, Missing Hash, Missing Timestamp
enum HTTPResponseCodes: Int {
    case SUCESS = 200
    case SUCCESS_CREATED = 201
    case NOTAUTHERIZED = 401
    case FORBIDDEN = 403
    case METHOD_NOT_ALLOWED = 405
    case MISSING_API_KEY = 409
}

