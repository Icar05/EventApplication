//
//  BaseSourcesViewController.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class BaseSourcesViewController: BaseTableViewController{
    
    let cellIndifier = "SourcesCell"
    
    var datasource: [Sources] = []
}

extension BaseSourcesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndifier) as! SourcesCell
            cell.fillCell(sources: datasource[indexPath.row])
            cell.selectionStyle = UITableViewCell.SelectionStyle.none;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.backgroundColor = UIColor.clear.cgColor
    }
}

extension BaseSourcesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        ApplicationNavigator.presentSourcesDetailController(current: self, sources: datasource[indexPath.row])
    }
}

