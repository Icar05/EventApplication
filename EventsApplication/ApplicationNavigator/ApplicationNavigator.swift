

import Foundation
import UIKit

class ApplicationNavigator {
    
    
    static func presentRootScreen(in window: UIWindow!){
        window.rootViewController = RootCreator.assembleModule()
        window.makeKeyAndVisible()
    }
    
    
    static func presentSingInController(current: UIViewController?, data: NSObject?) {
        let secondController : SignInViewController = SignInCreator.assembleModule() as! SignInViewController
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
    
    typealias searchDialogComplateion = (String)->Void
    static func presentSearchDialog(current: UIViewController?, completion: @escaping searchDialogComplateion) {
        let dialogStoryboard = UIStoryboard(name: "SearchDialog", bundle: nil)
        let customAlert = dialogStoryboard.instantiateViewController(withIdentifier: "UISearchDialog") as! UISearchDialog
            customAlert.setCompletion(completion: completion)
            current?.present(customizeDialog(customAlert: customAlert),
                             animated: true, completion: nil)
    }
    
    typealias selectDialogComplateion = (String)->Void
    static func presentSelectionDialog(current: UIViewController?, datasource: [String], completion: @escaping
        selectDialogComplateion) {
        let dialogStoryboard = UIStoryboard(name: "SelectionDialog", bundle: nil)
        let customAlert = dialogStoryboard.instantiateViewController(withIdentifier: "UISelectionDialog") as! UISelectionDialog
            customAlert.setCompletion(completion: completion)
            customAlert.setDatasource(value: datasource)
            current?.present(customizeDialog(customAlert: customAlert),
                             animated: true, completion: nil)
    }
    
    
    private static func customizeDialog(customAlert: UIViewController) -> UIViewController{
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        return customAlert
    }
}
