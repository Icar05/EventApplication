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
        
        self.tableView.register(UINib(nibName: cellIndifier, bundle: nil),
            forCellReuseIdentifier: cellIndifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.presenter.getSourcesByCategory(category: ValueForSelector.categories[6] )
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


extension SourcesViewController : SourcesView{
    
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

