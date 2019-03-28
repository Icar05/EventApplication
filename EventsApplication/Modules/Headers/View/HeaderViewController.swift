//
//  HeaderViewController.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class HeadersViewController: UIViewController {
    
    let cellIndifier = "ArticleCell"
    
    var datasource: [Articles] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HeaderPresenter!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.presenter.getDefaultHeadlines()
    }
    
    
}


extension HeadersViewController : HeaderView{
    
    func handleError(error: Error) {
        
        DispatchQueue.main.async {
            DialogHelper.presentErrorDialog(error: error, viewController: self)
        }
        
    }
    
    func updateTableView(articles: [Articles]) {
        
        DispatchQueue.main.async {
            self.datasource = articles
            self.tableView.reloadData()
        }
    }
    
    
}

extension HeadersViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndifier) as! ArticleCell
            cell.fillCell(article: datasource[indexPath.row])
        
        return cell
    }
    
    
}


