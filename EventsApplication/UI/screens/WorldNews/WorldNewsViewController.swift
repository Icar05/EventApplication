//
//  WorldNewsViewController.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit


/**
 private let languageTabItemTitle = NSLocalizedString("Language", comment: "")
 
 private let languageTabItemSubtitle = NSLocalizedString("Select language", comment: "")
 */
public final class WorldNewsViewController: BaseTableViewController {
   
    
    
    
    private let clearCurrentSelection = NSLocalizedString("Clear selection", comment: "")
    
    private let queryTabItemTitle = NSLocalizedString("Query", comment: "")
    
    private let queryTabItemSubtitle = NSLocalizedString("Select query", comment: "")
    
    private let dataSource = NewsDataSource()
    
    private let presenter: WorldNewsPresenter
        
    @IBOutlet weak var tableView: UITableView!
    
   
    
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(presenter: WorldNewsPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "WorldNewsViewController", bundle: Bundle.main)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.tableView.tableFooterView = UIView()
        
        self.addRefresh(tableView: tableView)
        self.dataSource.delegate = self
        
        self.presenter.viewDidLoad()
    }
    
    public override func onRefresh() {
        self.presenter.getFreshContent()
        self.refreshControl.beginRefreshing()
    }
    
}

extension WorldNewsViewController: NewsVC{
    
    public func handleError(error: Error) {
        self.handleError(tableView: tableView, error: error)
    }
    
    public func showLoading() {
        self.showLoading(tableView: tableView)
    }
    
    public func showEmptyView() {
        self.showEmptyView(tableView: tableView)
        self.dataSource.setData(data: [])
        self.tableView.reloadData()
    }
    
    public func updateContent(cells: [CustomCellModel]) {
        self.hideEmptyView(tableView: tableView)
        
        cells.forEach{
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: nil)
            self.tableView?.register(nib, forCellReuseIdentifier: $0.reuseIdentifier)
        }
        
        self.dataSource.setData(data: cells)
        self.tableView.reloadData()
    }
    
}

extension WorldNewsViewController: NewsDataSourceDelegate{
    
    func didItemSelected(item: CustomCellModel) {
        
        guard let new: NewsCellModel = item as? NewsCellModel else{
            return
        }
        
        self.navigateToArticleDetail(article: new.article)
    }
    
}

extension WorldNewsViewController : TabItem{
    
    func getRightNavBarButton() -> UIBarButtonItem? {
        return createNavItem(title: queryTabItemTitle, selector: "selectQuery")
    }
    
    func getLeftNavBarButton() -> UIBarButtonItem? {
        return createNavItem(title: clearCurrentSelection, selector: "clearAction")
    }
    
    @objc func clearAction(){
        self.presenter.clearQuery()
    }
    
    @objc func selectQuery(){
        self.presentSearchDialog(model: UISearchDialogModel(
            title: queryTabItemTitle,
            subtitle: queryTabItemSubtitle,
            hint: presenter.getQuery(),
            completion: { search in
                self.presenter.setQuery(query: search)
            }))
    }
    
}



