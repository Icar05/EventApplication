//
//  HeaderCreator.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class HeaderCreator: BaseCreator {
    
    static func getControllerIndifier() -> String {
        return "HeadersViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "Headers"
    }
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! HeadersViewController
        
        
        let presenter = HeaderPresenterImpl()
        let interactor = HeadersInteractorImpl()
        
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        
        return view
    }
    
    
}
