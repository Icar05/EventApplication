


import Foundation
import Alamofire

enum UrlRouter: URLRequestConvertible {
    
    static let baseURLString = "https:google_apple/api/"
    
    
    case signIn(String, String)
    case signOut
    
    
    var method: HTTPMethod {
        switch self {
        case .signIn: return .post
        case .signOut: return .post
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .signIn: return JSONEncoding.default
        case .signOut: return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let result: (path: String, parameters: Parameters?) = {
            switch self {
            case .signIn(let email, let password):
                return ("auth/login",["username": email, "password": password])
            case .signOut:
                return ("Auth/Logout", [:])
            }
        }()
        
        let url = try UrlRouter.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
        urlRequest.httpMethod = method.rawValue
//        if let token = Token.shared.accessToken {
//            urlRequest.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
//        }
        return try encoding.encode(urlRequest, with: result.parameters)
    }
}
