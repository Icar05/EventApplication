//
//  BaseTableViewController.swift
//  EventsApplication
//
//  Created by Eddson on 4/11/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class BaseTableViewController: UIViewController {

    let refreshControl = UIRefreshControl()
    
    func addRefresh(tableView: UITableView){
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }
  
}
