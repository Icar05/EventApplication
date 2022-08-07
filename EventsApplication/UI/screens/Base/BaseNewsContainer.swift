//
//  BaseNewsContainer.swift
//  EventsApplication
//
//  Created by ICoon on 07.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

public class BaseNewsContainer: UIViewController {
    
    
    internal let refreshControl = UIRefreshControl()
    
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
   
    /*
        refresh controll
     */
    public func onRefresh(){}
    
    @objc private func refresh(_ sender: Any) {
        self.onRefresh()
        self.refreshControl.endRefreshing()
    }
    
    
    internal func needRefresh(need: Bool, tableView: UITableView){
        if(need){
            addRefresh(tableView: tableView)
        }else{
            removeRefresh(tableView: tableView)
        }
    }
    
    internal func addRefresh(tableView: UITableView){
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }
    
    internal func removeRefresh(tableView: UITableView){
        tableView.refreshControl = nil
        if #available(iOS 10.0, *) {
            tableView.refreshControl = nil
        } else {
            self.refreshControl.removeFromSuperview()
        }
    }
    
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
