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
    
    private let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: cellIndifier)    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.presenter.getDefaultHeadlines()
        
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl)
        }
        
        self.refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    
    @objc private func refresh(_ sender: Any) {
   
        //todo refresh code
        self.refreshControl.endRefreshing()
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

extension HeadersViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        Router.presentArticleDetailController(current: self, article: datasource[indexPath.row])
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


