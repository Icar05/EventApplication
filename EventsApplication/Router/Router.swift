

import Foundation
import UIKit

class Router {
    
    
    static func presentRootScreen(in window: UIWindow!){
        window.makeKeyAndVisible()
        window.rootViewController = RootCreator.assembleModule()
    }
    

    static func presentRootScreen(current: UIViewController?) {
        let rootController = RootCreator.assembleModule()
        current?.navigationController?.present(rootController, animated: true)
    }
    
    
    static func presentSingInController(current: UIViewController?, data: NSObject?) {
        let secondController : SignInViewController = SignInCreator.assembleModule() as! SignInViewController
//        secondController.data = data
        current?.navigationController?.pushViewController(secondController, animated: true)
    }
    
    
}
