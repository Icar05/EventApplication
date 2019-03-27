//
//  SourcesCreator.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class SourcesCreator: BaseCreator {
    
    static func getControllerIndifier() -> String {
        return "SourcesViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "Sources"
    }
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! SourcesViewController
        
        
        let presenter = SourcesPresenterImpl()
        let interactor = SourcesInteractorImpl()
        
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        
        return view
    }
    
}
