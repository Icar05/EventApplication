//
//  HeaderViewController.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class HeadersViewController: BaseArticleController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emptyView: EmptyView!
    
    var presenter: HeaderPresenter!
    
    fileprivate let categoryTabItemTitle = NSLocalizedString("Category", comment: "")
    
    fileprivate let categoryTabItemSubtitle = NSLocalizedString("Select category", comment: "")
    
    fileprivate let countryTabItemTitle = NSLocalizedString("Country", comment: "")
    
    fileprivate let countryTabItemSubtitle = NSLocalizedString("Select country", comment: "")
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.register(UINib(nibName: cellIndifier, bundle: nil),
                                forCellReuseIdentifier: cellIndifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.addRefresh(tableView: tableView)
        self.presenter.onViewDidLoad()
    }
    
    
    override func onRefresh() {
        self.viewDidLoad()
        self.refreshControl.endRefreshing()
    }
    
    
}


extension HeadersViewController : HeaderView{
    
    func showLoading() {
        self.emptyView?.showLoading()
    }
    
    func hideLoading() {
        self.emptyView?.hideLoading()
    }
    
    func updateTableView(articles: [Articles]) {
        DispatchQueue.main.async {
            
            if(articles.count > 0){
                self.tableView.isHidden = false
                self.refillTableView(articles: articles)
            }else{
                self.tableView.isHidden = true
                self.emptyView.showEmptyView()
            }
            
        }
    }
    
    
    func refillTableView(articles: [Articles]){
        self.datasource = articles
        self.tableView.reloadData()
    }
    
}










