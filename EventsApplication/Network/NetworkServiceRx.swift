


import UIKit
import RxSwift
import Alamofire
//import SwiftyJSON

class NetworkServiceRx {

    static let shared = NetworkServiceRx()
    let sessionManager: SessionManager // = Alamofire.SessionManager.default
    
    private init(){
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20.0
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
//
//    func signIn(email: String, password: String) -> Observable<Session> {
//
//        return Observable<Session>.create({[weak self] (observer) -> Disposable in
//            let request = self?.sessionManager.request(FCRouter.signIn(email, password))
//                .validate()
//                .responseJSON { (response) in
//                    switch response.result {
//                    case .success(let value):
//                        if let session = Session(json: JSON(value)) {
//                            observer.onNext(session)
//                            observer.onCompleted()
//                        } else {
//                            observer.onError(NetworkManagerError.invalidJSON)
//                        }
//                    case .failure(let error):
//                        print("Signed in failed with error \(error.localizedDescription)")
//                        observer.onError(NetworkManagerError.commonError)
//                    }
//            }
//            return Disposables.create {
//                request?.cancel()
//            }
//        })
//    }
//
//    func logout() -> Observable<Bool> {
//        return Observable.create({[weak self] (observer) -> Disposable in
//            let request = self?.sessionManager.request(FCRouter.signOut)
//            .validate()
//                .responseJSON(completionHandler: { (response) in
//                    switch response.result {
//                    case .success(_):
//                        observer.onNext(true)
//                        observer.onCompleted()
//                    case .failure(let error):
//                        observer.onError(NetworkManagerError.invalidJSON)
//                        print("Signed out failed with error \(error.localizedDescription)")
//                    }
//                })
//            return Disposables.create {
//                request?.cancel()
//            }
//        })
//    }
//
    
  
   
    
   
    
//    func getX() -> Observable<[X]> {
//        return Observable<[X]>.create({(observer) -> Disposable in
//            let request = self.sessionManager.request(UrlRouter.login)
//                .validate()
//                .responseJSON(completionHandler: { (response) in
//                    switch response.result {
//                    case .success(let value):
//                        let json = JSON(value).arrayValue
//                        let buildings = json.flatMap({ X(json: $0) })
//                        observer.onNext(buildings)
//                        observer.onCompleted()
//                    case .failure(let error):
//                        observer.onError(NetworkManagerError.invalidJSON)
//                        print("Fetch x failed with error \(error.localizedDescription)")
//                    }
//                })
//            return Disposables.create {
//                request.cancel()
//            }
//        })
//    }
    
    
    
//    private func constructRequest(url: URL) -> URLRequest {
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = HTTPMethod.put.rawValue
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        if let token = Token.shared.accessToken {
//            request.setValue("Token \(token)", forHTTPHeaderField: "Authorization")
//        }
//        return request
//    }
    
}
