

import Foundation
import UIKit

class ApplicationNavigator {
    
    
    func navigate(from: UIViewController, to: UIViewController){
        from.navigationController?.pushViewController(to, animated: true)
    }
    
    func present(from: UIViewController, to: UIViewController){
        from.present(to, animated: true, completion: nil)
    }
    
    func initRootScreen(in window: UIWindow){
        window.rootViewController = getRootViewController()
        window.makeKeyAndVisible()
    }
    
    func getRootViewController() -> UITabBarController{
        return RootViewController()
    }
    
    func getNewsViewController(interactor: HeadersInteractor, repository: Repository) -> UIViewController{
        
        let presenter = NewsPresenter(interactor: interactor, resository: repository)
        let vc = NewsViewController(presenter: presenter)
        presenter.set(view: vc)
        
        return UINavigationController(rootViewController: vc)
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
    

    func getSearchDialog(model: UISearchDialogModel) -> UISearchDialog {
        let dialogStoryboard = UIStoryboard(name: "SearchDialog", bundle: nil)
        let customAlert = dialogStoryboard.instantiateViewController(withIdentifier: "UISearchDialog") as! UISearchDialog
            customAlert.setModel(model: model)
        
        return customAlert
    }
    
    func getSelectionDialog(model: UISelectionDialogModel) -> UISelectionDialog {
        let dialogStoryboard = UIStoryboard(name: "SelectionDialog", bundle: nil)
        let customAlert = dialogStoryboard.instantiateViewController(withIdentifier: "UISelectionDialog") as! UISelectionDialog
            customAlert.setModel(model: model)
           
       return customAlert
    }
    
}
