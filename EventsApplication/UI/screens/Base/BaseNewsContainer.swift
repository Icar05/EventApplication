//
//  BaseNewsContainer.swift
//  EventsApplication
//
//  Created by ICoon on 07.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

public class BaseNewsContainer: UIViewController {
    
    
    /*
        dialogs
     */
    internal func presentSelectionDialog(model: UISelectionDialogModel){
        let navigator = getApplication().getNavigator()
        let dialog = navigator.getSelectionDialog(model: model)
        navigator.present(from: self, to: dialog)
    }
    
    internal func presentSearchDialog(model: UISearchDialogModel){
        let navigator = getApplication().getNavigator()
        let dialog = navigator.getSearchDialog(model: model)
        navigator.present(from: self, to: dialog)
    }
    
    
    /**
     navigation
     **/
    internal func navigateToArticleDetail(article: Articles){
        let navigator = getApplication().getNavigator()
        let destination = navigator.getArticleDetailScreen(article: article)
        navigator.navigate(from: self, to: destination)
    }
    
    internal func navigateToSourceDetail(source: Sources){
        let navigator = getApplication().getNavigator()
        let destination = navigator.getSourceDetailScreen(sources: source)
        navigator.navigate(from: self, to: destination)
    }
    
}
