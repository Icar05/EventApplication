

import Foundation
import UIKit

class Router {
    
    
    static func presentRootScreen(in window: UIWindow!){
        window.rootViewController = RootCreator.assembleModule()
        window.makeKeyAndVisible()
    }
    
    
    // if we sould go to root screen directly
    static func presentRootScreen(current: UIViewController?) {
        let rootController = RootCreator.assembleModule()
        current?.navigationController?.present(rootController, animated: true)
    }
    
    
    static func presentSingInController(current: UIViewController?, data: NSObject?) {
        let secondController : SignInViewController = SignInCreator.assembleModule() as! SignInViewController
//        secondController.data = data
        current?.navigationController?.pushViewController(secondController, animated: true)
    }
    
    static func presentArticleDetailController(current: UIViewController?, article: Articles) {
        let articleDetailViewController : ArticleDetailViewController = ArticleDetailCreator.assembleModule()
            as! ArticleDetailViewController
                articleDetailViewController.article = article
        current?.navigationController?.pushViewController(articleDetailViewController, animated: true)
    }
    
    static func presentSourcesDetailController(current: UIViewController?, sources: Sources) {
        let sourcesDetailViewController : SourcesDetailViewController = SourcesDetailCreator.assembleModule()
            as! SourcesDetailViewController
        sourcesDetailViewController.sources = sources
        current?.navigationController?.pushViewController(sourcesDetailViewController, animated: true)
    }
}
