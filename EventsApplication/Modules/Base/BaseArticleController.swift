//
//  BaseArticleController.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class BaseArticleController: UIViewController {
    
     let refreshControl = UIRefreshControl()
    
     let cellIndifier = "ArticleCell"
    
     var datasource: [Articles] = []
    
    
}

extension BaseArticleController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndifier) as! ArticleCell
            cell.fillCell(article: datasource[indexPath.row])
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
         cell.layer.backgroundColor = UIColor.clear.cgColor
        
         (cell as! BaseCell).setBlur()
    }
    

    
}

extension BaseArticleController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        ApplicationNavigator.presentArticleDetailController(current: self, article: datasource[indexPath.row])
    }
    
    func addRefresh(tableView: UITableView){
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }
}


