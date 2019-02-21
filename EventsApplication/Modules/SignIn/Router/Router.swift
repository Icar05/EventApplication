

import Foundation
import UIKit

class Router {
    
    
    static func presentRootScreen(in window: UIWindow!){
        window.makeKeyAndVisible()
        window.rootViewController = SignInCreator.assembleModule()
    }
    

    static func presentRootScreen(current: UIViewController?) {
        let rootController = SignInCreator.assembleModule()
        current?.navigationController?.present(rootController, animated: true)
    }
    
    
//    static func presentSecondScreen(current: UIViewController?, data: NSObject) {
//        let secondController : SecondViewController = SecondCreator.assembleModule() as! SecondViewController
//        secondController.data = data
//        current?.navigationController?.pushViewController(secondController, animated: true)
//    }
    
    
}
