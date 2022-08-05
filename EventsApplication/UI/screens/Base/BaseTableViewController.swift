//
//  BaseTableViewController.swift
//  EventsApplication
//
//  Created by Eddson on 4/11/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

public class BaseTableViewController: UIViewController {
    
    
    internal let refreshControl = UIRefreshControl()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    public func onRefresh(){}
    
    @objc private func refresh(_ sender: Any) {
        self.onRefresh()
    }
    
    internal func addRefresh(tableView: UITableView){
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }
    
    internal func handleError(error: Error) {
        DispatchQueue.main.async {
            DialogHelper.presentErrorDialog(error: error, viewController: self)
        }
    }
    
    
    internal func presentSelectionDialog(model: UISelectionDialogModel){
        let navigator = getApplication().getNavigator()
        let dialog = navigator.getSelectionDialog(model: model)
        navigator.present(from: self, to: dialog)
    }
    
  
}
