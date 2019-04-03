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
    
    var query: String = ValueForSelector.defaultQuery
    
    var language: String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: cellIndifier, bundle: nil),
            forCellReuseIdentifier: cellIndifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.fetchData()
        self.refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        self.addRefresh(tableView: tableView)
    }
    
    @objc private func refresh(_ sender: Any) {
        self.fetchData()
        self.refreshControl.endRefreshing()
    }

    private func fetchData(){
        self.language == nil ?
            self.presenter.getEverything(query: query):
            self.presenter.getEverything(query: query, language: language!)
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
extension EverythingViewController : TabItem{
    
    func getNavBarButtons() -> [UIBarButtonItem?] {
        return [createNavItem(title: "Lang", selector: "selectLanguage"),
                createNavItem(title: "Query", selector: "selectQuery")]
    }
    
    
    @objc func selectLanguage(){
       ApplicationNavigator.presentSelectionDialog(current: self, datasource: ValueForSelector.languages, completion: { language in
            self.language = language
            self.fetchData()
        })
    }
    
    @objc func selectQuery(){
        ApplicationNavigator.presentSearchDialog(
            current: self, completion: { search in
                self.query = search.isEmpty ? ValueForSelector.defaultQuery: search
                self.fetchData()
        })
    }
    
}
