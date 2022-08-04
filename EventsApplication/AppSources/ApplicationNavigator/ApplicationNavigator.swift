

import Foundation
import UIKit

class ApplicationNavigator {
    
    
    static func presentRootScreen(in window: UIWindow!){
        window.rootViewController = RootCreator.assembleModule()
        window.makeKeyAndVisible()
    }
    
    
    static func presentArticleDetailController(current: UIViewController?, article: Articles) {
        
        let presenter = DetailPresenter(article: article)
        let viewController = DetailViewController(presenter: presenter)
        presenter.set(view: viewController)
        
        current?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    /**
     //        let sourcesDetailViewController : SourcesDetailViewController = SourcesDetailCreator.assembleModule()
     //            as! SourcesDetailViewController
     //        sourcesDetailViewController.sources = sources
     */
    static func presentSourcesDetailController(current: UIViewController?, sources: Sources) {
        let presenter = DetailSourcePresenter(sources: sources)
        let viewController = DetailSourceViewController(presenter: presenter)
        presenter.set(view: viewController)

        current?.navigationController?.pushViewController(viewController, animated: true)
    }
    

    static func presentSearchDialog(model: UISearchDialogModel, current: UIViewController?) {
        let dialogStoryboard = UIStoryboard(name: "SearchDialog", bundle: nil)
        let customAlert = dialogStoryboard.instantiateViewController(withIdentifier: "UISearchDialog") as! UISearchDialog
            customAlert.setModel(model: model)
            current?.present(customAlert, animated: true, completion: nil)
    }
    
    static func presentSelectionDialog(model: UISelectionDialogModel, current: UIViewController?) {
        let dialogStoryboard = UIStoryboard(name: "SelectionDialog", bundle: nil)
        let customAlert = dialogStoryboard.instantiateViewController(withIdentifier: "UISelectionDialog") as! UISelectionDialog
            customAlert.setModel(model: model)
            current?.present(customAlert,animated: true, completion: nil)
    }
    
}
