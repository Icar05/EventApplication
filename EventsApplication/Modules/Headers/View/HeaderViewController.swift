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
    
    var category = ""
    
    var country = ""
    
    
    
  
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
    
    
    private func fetchData(){
        if(!country.isEmpty){
            self.presenter.getHeadlines(country: country)
        }else if(!category.isEmpty){
            self.presenter.getHeadlines(category: category)
        }else{
            self.presenter.getHeadlines()
        }
    }
    
    @objc private func refresh(_ sender: Any) {
        self.fetchData()
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

extension HeadersViewController: TabItem{
    
    
    func getNavBarButtons() -> [UIBarButtonItem?] {
        return [createNavItem(title: "Category", selector: "selectCategory"),
                createNavItem(title: "Country", selector: "selectCountry")]
    }

    
    
    @objc func selectCategory(){
        ApplicationNavigator.presentSelectionDialog(current: self, datasource: ValueForSelector.categories,
                                                    completion: { category in
                   self.category = category
                   self.country = ""
            })
    }
    
    
    @objc func selectCountry(){
            ApplicationNavigator.presentSelectionDialog(current: self, datasource: ValueForSelector.languages,
                                                        completion: { country in
                   self.country = country
                   self.category = ""
            })
    }
    
}









