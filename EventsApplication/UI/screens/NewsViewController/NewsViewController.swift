//
//  NewsViewController.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

/**
 fileprivate let categoryTabItemTitle = NSLocalizedString("Category", comment: "")
 
 fileprivate let categoryTabItemSubtitle = NSLocalizedString("Select category", comment: "")
 
 fileprivate let countryTabItemTitle = NSLocalizedString("Country", comment: "")
 
 fileprivate let countryTabItemSubtitle = NSLocalizedString("Select country", comment: "")
 */

public final class NewsViewController: BaseTableViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = NewsDataSource()
    
    private let presenter: NewsPresenter
    
    
    
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(presenter: NewsPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "NewsViewController", bundle: Bundle.main)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.tableView.tableFooterView = UIView()
        
        self.addRefresh(tableView: tableView)
        
        self.presenter.viewDidLoad()
    }
    
    func registerCells(models: [CustomCellModel]){
        
        models.forEach{
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: nil)
            self.tableView?.register(nib, forCellReuseIdentifier: $0.reuseIdentifier)
        }
        
        self.dataSource.setData(data: models)
        self.tableView.reloadData()
    }
    
    public override func onRefresh() {
        #warning("handle it")
        print("need handle it")
    }
   
    func showLoading() {
        #warning("handle it")
//        self.emptyView?.showLoading()
    }
    
    func hideLoading() {
        #warning("handle it")
//        self.emptyView?.hideLoading()
    }
    
}



