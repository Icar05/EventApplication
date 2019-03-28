//
//  BaseSourcesViewController.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class BaseSourcesViewController: UIViewController{
    
    let refreshControl = UIRefreshControl()
    
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
        
        return cell
    }
    
}

extension BaseSourcesViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        Router.presentSourcesDetailController(current: self, sources: datasource[indexPath.row])
    }
}
