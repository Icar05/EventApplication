


import Foundation
import Alamofire

enum UrlRouter: URLRequestConvertible {
    
    static let apiKey = "956a81e3ea184cb7b8f2a6b3a4ea0c33"
    
    static let baseUrl = "https://newsapi.org/v2/"
    
    
    case getDefaultHeadlines()
    case getHeadlinesByCountry(String)
    case getHeadlinesByCategory(String)
    case getEverythingByQuery(String)
    case getEverythingByLanguage(String)
    case getSourcesByCategory(String)
    

    
    var method: HTTPMethod {
        switch self {
                case .getDefaultHeadlines: return .get
                case .getHeadlinesByCountry: return .get
                case .getHeadlinesByCategory: return .get
                case .getEverythingByQuery: return .get
                case .getEverythingByLanguage: return .get
                case .getSourcesByCategory: return .get
            }
    }
    
    var encoding: ParameterEncoding {
        switch self {
            case .getDefaultHeadlines: return URLEncoding.default
            case .getHeadlinesByCountry: return URLEncoding.default
            case .getHeadlinesByCategory: return URLEncoding.default
            case .getEverythingByQuery: return URLEncoding.default
            case .getEverythingByLanguage: return URLEncoding.default
            case .getSourcesByCategory: return URLEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let result: (path: String, parameters: Parameters?) = {
            switch self {
                
            case .getDefaultHeadlines():
                return ("v2/top-headlines?", ["country": "ua", "apikey": UrlRouter.apiKey])
            case .getHeadlinesByCountry(let country):
                return ("v2/top-headlines?", ["country": country, "apikey": UrlRouter.apiKey])
            case .getHeadlinesByCategory(let category):
                return ("v2/top-headlines?", ["category": category, "apikey": UrlRouter.apiKey])
            case .getEverythingByQuery(let query):
                return ("v2/everything?", ["q": query, "apikey": UrlRouter.apiKey])
            case .getEverythingByLanguage(let language):
                return ("v2/everything?", ["language": language, "apikey": UrlRouter.apiKey])
            case .getSourcesByCategory(let category):
                 return ("v2/everything?", ["category": category, "apikey": UrlRouter.apiKey])
            }
                
        }()
        
            let url = try UrlRouter.baseUrl.asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
            urlRequest.httpMethod = method.rawValue
        
        return try encoding.encode(urlRequest, with: result.parameters)
    }
}
