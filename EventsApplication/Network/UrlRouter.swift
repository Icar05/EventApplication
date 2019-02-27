


import Foundation
import Alamofire

enum UrlRouter: URLRequestConvertible {
    
    static let apiKey = "FF1SpQGmTkz7NyQYWYbU8p2z4zgAES2G"
    
    static let baseUrl = "https://app.ticketmaster.com/discovery/"
    


    
    case searchEventByKeyword(String)
    case searchEventsByCity(String)
    case searchEventByCityAndName(String, String)
    
    
    var method: HTTPMethod {
        switch self {
                case .searchEventsByCity: return .get
                case .searchEventByKeyword: return .get
                case .searchEventByCityAndName: return .get
            }
    }
    
    var encoding: ParameterEncoding {
        switch self {
            case .searchEventsByCity: return JSONEncoding.default
            case .searchEventByKeyword : return JSONEncoding.default
            case .searchEventByCityAndName: return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        //     attractionId & countryCode
        //     "https://app.ticketmaster.com/discovery/v2/events.json?attractionId=K8vZ917Gku7&countryCode=CA&apikey=FF1SpQGmTkz7NyQYWYbU8p2z4zgAES2G"
        //
        //
        //        countrycode
        //    https://app.ticketmaster.com/discovery/v2/events.json?
        //       countryCode=US&apikey=FF1SpQGmTkz7NyQYWYbU8p2z4zgAES2G
        //
        //        Search for events sourced by Universe in the United States with keyword “devjam”
        //    https://app.ticketmaster.com/discovery/v2/events.json?keyword=devjam&source=universe&countryCode=US&apikey=FF1SpQGmTkz7NyQYWYbU8p2z4zgAES2G
        //
        //        Search for music events in the Los Angeles area
        //    https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&dmaId=324&apikey=FF1SpQGmTkz7NyQYWYbU8p2z4zgAES2G
        //
        
        
        let result: (path: String, parameters: Parameters?) = {
            switch self {
                
            case .searchEventsByCity(let city):
                return ("v2/events.json?", ["city": city, "apikey": UrlRouter.apiKey])
                
            case .searchEventByKeyword(let keyword):
                 return ("v2/events.json?", ["keyword": keyword, "apikey": UrlRouter.apiKey])
                
            case .searchEventByCityAndName(let cityName, let keyword):
                return ("v2/events.json?", ["city": cityName, "keyword": keyword, "apikey": UrlRouter.apiKey])
            }
           
        }()
        
            let url = try UrlRouter.baseUrl.asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
            urlRequest.httpMethod = method.rawValue
        
        return try encoding.encode(urlRequest, with: result.parameters)
    }
}
