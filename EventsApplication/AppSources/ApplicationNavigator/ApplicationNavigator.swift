

import Foundation
import UIKit

class ApplicationNavigator {
    
    
    static func presentRootScreen(in window: UIWindow!){
        window.rootViewController = RootCreator.assembleModule()
        window.makeKeyAndVisible()
    }
    
    
    func navigate(from: UIViewController, to: UIViewController){
        from.navigationController?.pushViewController(to, animated: true)
    }
    
    func getArticleDetailScreen(article: Articles) -> UIViewController {
        
        let presenter = DetailPresenter(article: article)
        let viewController = DetailViewController(presenter: presenter)
        presenter.set(view: viewController)
        
        return viewController
    }
    
    func getSourceDetailScreen(sources: Sources) -> UIViewController {
        let presenter = DetailSourcePresenter(sources: sources)
        let viewController = DetailSourceViewController(presenter: presenter)
        presenter.set(view: viewController)

        return viewController
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
