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
        
            presenter.view = view
            presenter.interactor = interactor
        
            view.presenter = presenter
        
        return view
    }
   
}
