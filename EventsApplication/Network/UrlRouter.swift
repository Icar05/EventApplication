


import Foundation
import Alamofire

enum UrlRouter: URLRequestConvertible {
    
    static let apiKey = "956a81e3ea184cb7b8f2a6b3a4ea0c33"
    
    static let baseUrl = "https://newsapi.org/"
    
    
    case getDefaultHeadlines()
    case getHeadlinesByCountry(String)
    case getEverythingByQuery(String)
    case getSourcesByCategory(String)
    

    
    var method: HTTPMethod {
        switch self {
                case .getDefaultHeadlines: return .get
                case .getHeadlinesByCountry: return .get
                case .getEverythingByQuery: return .get
                case .getSourcesByCategory: return .get
            }
    }
    
    var encoding: ParameterEncoding {
        switch self {
            case .getDefaultHeadlines: return URLEncoding.default
            case .getHeadlinesByCountry: return URLEncoding.default
            case .getEverythingByQuery: return URLEncoding.default
            case .getSourcesByCategory: return URLEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let result: (path: String, parameters: Parameters?) = {
            switch self {
                
                case .getDefaultHeadlines():
                    return ("v2/top-headlines", ["apiKey": UrlRouter.apiKey,
                                                 "country": CountryUtil.getDefaultCountry()])
                
                case .getHeadlinesByCountry(let country):
                    return ("v2/top-headlines", ["apiKey": UrlRouter.apiKey,
                                                 "country": country])
                
                case .getEverythingByQuery(let query):
                    return ("v2/everything",    ["apiKey": UrlRouter.apiKey,
                                                 "page": 1,
                                                 "q": query])
                
                case .getSourcesByCategory(let category):
                     return ("v2/sources",   ["apiKey": UrlRouter.apiKey,
                                                 "category": category])
                }
                
        }()
        
            let url = try UrlRouter.baseUrl.asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
            urlRequest.httpMethod = method.rawValue
        
        return try encoding.encode(urlRequest, with: result.parameters)
    }
    
}
