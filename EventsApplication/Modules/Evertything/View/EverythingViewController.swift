//
//  EverythingViewControllerImpl.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class EverythingViewController: BaseArticleController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emptyView: EmptyView!
    var presenter: EverythingPresenter!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: cellIndifier, bundle: nil),
            forCellReuseIdentifier: cellIndifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.presenter.getEverythingByQuery(query: "Apple")
        self.refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        self.addRefresh()
    }
    
    @objc private func refresh(_ sender: Any) {
        
        //todo refresh code
        self.refreshControl.endRefreshing()
    }
    
    
    func addRefresh(){
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl)
        }
    }
    
}


extension EverythingViewController : EverythingView{
    
    
    func showLoading() {
        self.emptyView.showLoading()
    }
    
    func hideLoading() {
        self.emptyView.hideLoading()
    }
    
    
    func handleError(error: Error) {
        self.emptyView.showEmptyView()
        DispatchQueue.main.async {
            DialogHelper.presentErrorDialog(error: error, viewController: self)
        }
    }
    
    func updateTableView(articles: [Articles]) {
        DispatchQueue.main.async {
            articles.count > 0 ?
                self.refillTableView(articles: articles) :
                self.emptyView.showEmptyView()
        }
    }
    
    func refillTableView(articles: [Articles]){
        self.datasource = articles
        self.tableView.reloadData()
    }
    
}

extension EverythingViewController : HasQuery, HasLanguage{
    
    func queryDidChanged(query: String) {
         print("QueryChange -> everything vc, query: \(query)")
    }
    
    func languageDidChanged(language: String) {
         print("QueryChange -> everything vc, lang: \(language)")
    }
    
}
