


import UIKit
import RxSwift
import Alamofire

class NetworkServiceRx {

    
    let sessionManager: Session // = Alamofire.SessionManager.default
    let jsonDecoder: JSONDecoder = JSONDecoder()


    init(){
        let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 20.0
        self.sessionManager = Alamofire.Session(configuration: configuration)
    }


    //  headers by country. get values from selector
    func getHeadlinesByCountry(country: String) -> Observable<[Articles]>{
        return Observable<[Articles]>.create({[weak self] (observer) -> Disposable in
            let request = self?.sessionManager.request(UrlRouter.getHeadlinesByCountry(country))
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case .success( _):

                        let responseModel  = try! self!.jsonDecoder.decode(Json4Swift_Base.self, from:response.data!)
                        observer.onNext(responseModel.articles!)
                        observer.onCompleted()

                    case .failure(let error):
                        self?.debug(value: "getHeadlinesByCountry: \(error.localizedDescription)")
                        observer.onError(error)
                    }
            }
            return Disposables.create {
                request?.cancel()
            }
        })
    }


    //  everything by query
    func getEverythingByQuery(query: String) -> Observable<[Articles]>{
        return Observable<[Articles]>.create({[weak self] (observer) -> Disposable in
            let request = self?.sessionManager.request(UrlRouter.getEverythingByQuery(query))
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case .success(_):

                        let responseModel  = try! self!.jsonDecoder.decode(Json4Swift_Base.self, from:response.data!)
                        observer.onNext(responseModel.articles!)
                        observer.onCompleted()

                    case .failure(let error):
                        self?.debug(value: "getEverythingByQuery: \(error.localizedDescription)")
                        observer.onError(error)
                    }
            }
            return Disposables.create {
                request?.cancel()
            }
        })
    }


    //get sources. categories from selector
    func getSourcesByCategory(category: String) -> Observable<[Sources]>{
        return Observable<[Sources]>.create({[weak self] (observer) -> Disposable in
            let request = self?.sessionManager.request(UrlRouter.getSourcesByCategory(category))
                .validate()
                .responseJSON { (response) in
                    switch response.result {
                    case .success( _):

                        let responseModel  = try! self!.jsonDecoder.decode(Json4Swift_Base.self, from:response.data!)
                        observer.onNext(responseModel.sources!)
                        observer.onCompleted()

                    case .failure(let error):
                        self?.debug(value: "getSourcesByCategory: \(error.localizedDescription)")
                        observer.onError(error)
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
