//
//  ArticleDetailCreator.swift
//  EventsApplication
//
//  Created by Eddson on 3/28/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailCreator: BaseCreator {
    
    
    
    static func getControllerIndifier() -> String {
        return "ArticleDetailViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "ArticleDetail"
    }
    
    static func assembleModule() -> UIViewController {
        
        
        let view = getSelfUIViewController() as! ArticleDetailViewController
        
        
        let presenter = ArticleDetailPresenterImpl()
        let interactor = ArticleDetailInteractorImpl()
        
            presenter.view = view
            presenter.interactor = interactor
        
            view.presenter = presenter
    
        return view
    }
    
}
