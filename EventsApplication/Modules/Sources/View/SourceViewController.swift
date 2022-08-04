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
    
    fileprivate let categoryTabItemTitle = NSLocalizedString("Category", comment: "")
    
    fileprivate let categoryTabItemSubtitle = NSLocalizedString("Select category", comment: "")
    
    
    
    
    
    
    
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


extension SourcesViewController : SourcesView{
    
    func showLoading() {
        self.emptyView.showLoading()
    }
    
    func hideLoading() {
        self.emptyView.hideLoading()
    }
    
    func updateTableView(sources: [Sources]) {
        DispatchQueue.main.async {
            if(sources.count > 0){
                self.tableView.isHidden = false
                self.refillTableView(sources: sources)
            }else{
                self.tableView.isHidden = true
                self.emptyView.showEmptyView()
            }
        }
    }
    
    func refillTableView(sources: [Sources]){
        self.datasource = sources
        self.tableView.reloadData()
    }
    
}

extension SourcesViewController: TabItem{
    
    func getNavBarButton() -> UIBarButtonItem? {
        return createNavItem(title: categoryTabItemTitle, selector: "selectCategory")
    }
    
    @objc func selectCategory(){
        ApplicationNavigator.presentSelectionDialog(
            model: UISelectionDialogModel(
                title: categoryTabItemTitle,
                subtitle: categoryTabItemSubtitle,
                dataSourse: ValueForSelector.categories,
                completion: {category in
                    self.presenter.setCategory(category: category)
                }),
            current: self)
    }
    
}
