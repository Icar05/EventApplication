//
//  SignInCreator.swift
//  EventsApplication
//
//  Created by Eddson on 2/21/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class SignInCreator: BaseCreator {
    
    
    
    
    static func getControllerIndifier() -> String {
        return "SignInViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "SignIn"
    }
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! SignInViewController
        
        
        let presenter = SignInPresenterImpl()
        let interactor = SignInInteractorImpl()
        
        let navigation = UINavigationController(rootViewController: view)
        navigation.navigationBar.tintColor = UIColor.red
        
        
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        navigation.navigationBar.topItem!.backBarButtonItem = backButton
        
        
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        
        return navigation
    }
   
}
