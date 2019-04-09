//
//  SourceViewController.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class SourcesViewController: BaseSourcesViewController {
    
    
    @IBOutlet weak var emptyView: EmptyView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SourcesPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setBackground(vc: self)
        self.tableView.register(UINib(nibName: cellIndifier, bundle: nil),
            forCellReuseIdentifier: cellIndifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        self.addRefresh(tableView: tableView)
        self.presenter.onViewDidLoad()
    }
    
    
    @objc private func refresh(_ sender: Any) {
        self.presenter.onViewDidLoad()
        self.refreshControl.endRefreshing()
    }
    
}


extension SourcesViewController : SourcesView{
    
    func showLoading() {
        self.emptyView.showLoading()
    }
    
    func hideLoading() {
        self.emptyView.hideLoading()
    }
    
    
    func handleError(error: Error) {
        DispatchQueue.main.async {
            self.emptyView.showEmptyView()
            DialogHelper.presentErrorDialog(error: error, viewController: self)
        }
    }
    
    func updateTableView(sources: [Sources]) {
        DispatchQueue.main.async {
            sources.count > 0 ?
                self.refillTableView(sources: sources) :
                self.emptyView.showEmptyView()
        }
    }
    
    func refillTableView(sources: [Sources]){
        self.datasource = sources
        self.tableView.reloadData()
    }
    
}

extension SourcesViewController: TabItem{
    
    func getNavBarButtons() -> [UIBarButtonItem?] {
        return [createNavItem(title: "Category", selector: "selectCategory"), nil]
    }
    
    @objc func selectCategory(){
        
        let title = "Category"
        let subtitle = "Select category"
        
        ApplicationNavigator.presentSelectionDialog(
            title: title,
            subtitle: subtitle,
            current: self,
            datasource: ValueForSelector.categories,
            completion: { category in
             self.presenter.setCategory(category: category)
        })
    }
   
}
