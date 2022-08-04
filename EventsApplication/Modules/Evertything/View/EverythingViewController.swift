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
    
    fileprivate let languageTabItemTitle = NSLocalizedString("Language", comment: "")
    
    fileprivate let languageTabItemSubtitle = NSLocalizedString("Select language", comment: "")
    
    fileprivate let queryTabItemTitle = NSLocalizedString("Query", comment: "")
    
    fileprivate let queryTabItemSubtitle = NSLocalizedString("Select query", comment: "")
    
    
    
    
    
    
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
        self.presenter.onViewDidLoad()
        self.refreshControl.endRefreshing()
    }
    
}


extension EverythingViewController : EverythingView{
    
    
    func showLoading() {
        self.emptyView.showLoading()
    }
    
    func hideLoading() {
        self.emptyView.hideLoading()
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
extension EverythingViewController : TabItem{
    
    func getNavBarButton() -> UIBarButtonItem? {
        return createNavItem(title: queryTabItemTitle, selector: "selectQuery")
    }
    
    @objc func selectQuery(){
        ApplicationNavigator.presentSearchDialog(
            model: UISearchDialogModel(
                title: queryTabItemTitle,
                subtitle: queryTabItemSubtitle,
                completion: { search in
                    self.presenter.setQuery(query: search)
                }),
            current: self)
    }
    
}
