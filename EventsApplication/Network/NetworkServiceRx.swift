


import UIKit
import RxSwift
import Alamofire

class NetworkServiceRx {

    
    
    static let shared = NetworkServiceRx()
    let sessionManager: SessionManager // = Alamofire.SessionManager.default
    
    
    
    private init(){
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20.0
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
    }

    
    
    //  all new headers
    func getDefaultHeadlines() -> Observable<String>{
        return Observable<String>.create({[weak self] (observer) -> Disposable in
                    let request = self?.sessionManager.request(UrlRouter.getDefaultHeadlines())
                        .validate()
                        .responseJSON { (response) in
                            switch response.result {
                            case .success(let value):
                                    observer.onNext("value: \(value)")
                                    observer.onCompleted()
                            case .failure(let error):
                                    self?.debug(value: "getDefaultHeadlines: \(error.localizedDescription)")
                                    observer.onError(error.localizedDescription as! Error)
                            }
                    }
                    return Disposables.create {
                        request?.cancel()
                    }
                })
    }
    
    
    //  headers by country. get values from selector
    func getHeadlinesByCountry(country: String) -> Observable<String>{
        return Observable<String>.create({[weak self] (observer) -> Disposable in
            let request = self?.sessionManager.request(UrlRouter.getHeadlinesByCountry(country))
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        observer.onNext("value: \(value)")
                        observer.onCompleted()
                    case .failure(let error):
                        self?.debug(value: "getHeadlinesByCountry: \(error.localizedDescription)")
                        observer.onError(error.localizedDescription as! Error)
                    }
            }
            return Disposables.create {
                request?.cancel()
            }
        })
    }
    
    
    
    //  headers by category. get values from selector
    func getHeadlinesByCategory(category: String) -> Observable<String>{
        return Observable<String>.create({[weak self] (observer) -> Disposable in
            let request = self?.sessionManager.request(UrlRouter.getHeadlinesByCategory(category))
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        observer.onNext("value: \(value)")
                        observer.onCompleted()
                    case .failure(let error):
                        self?.debug(value: "getHeadlinesByCategory: \(error.localizedDescription)")
                        observer.onError(error.localizedDescription as! Error)
                    }
            }
            return Disposables.create {
                request?.cancel()
            }
        })
    }
    
    
    
    //  everything by query
    func getEverythingByQuery(query: String) -> Observable<String>{
        return Observable<String>.create({[weak self] (observer) -> Disposable in
            let request = self?.sessionManager.request(UrlRouter.getEverythingByQuery(query))
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        observer.onNext("value: \(value)")
                        observer.onCompleted()
                    case .failure(let error):
                        self?.debug(value: "getEverythingByQuery: \(error.localizedDescription)")
                        observer.onError(error.localizedDescription as! Error)
                    }
            }
            return Disposables.create {
                request?.cancel()
            }
        })
    }
    
    
    // everything by language
    func getEverythingByLanguage(lang: String) -> Observable<String>{
        return Observable<String>.create({[weak self] (observer) -> Disposable in
            let request = self?.sessionManager.request(UrlRouter.getEverythingByLanguage(lang))
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        observer.onNext("value: \(value)")
                        observer.onCompleted()
                    case .failure(let error):
                        self?.debug(value: "getEverythingByLanguage: \(error.localizedDescription)")
                        observer.onError(error.localizedDescription as! Error)
                    }
            }
            return Disposables.create {
                request?.cancel()
            }
        })
    }
    
    //get sources. categories from selector
    func getSourcesByCategory(category: String) -> Observable<String>{
        return Observable<String>.create({[weak self] (observer) -> Disposable in
            let request = self?.sessionManager.request(UrlRouter.getSourcesByCategory(category))
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        observer.onNext("value: \(value)")
                        observer.onCompleted()
                    case .failure(let error):
                        self?.debug(value: "getSourcesByCategory: \(error.localizedDescription)")
                        observer.onError(error.localizedDescription as! Error)
                    }
            }
            return Disposables.create {
                request?.cancel()
            }
        })
    }
 
    
    
    func debug(value: String){
        print("NetworkServiceRx: \(value)")
    }
    
}
