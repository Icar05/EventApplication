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
    

   
    
    private let queryTabItemTitle = NSLocalizedString("Query", comment: "")
    
    private let queryTabItemSubtitle = NSLocalizedString("Select query", comment: "")
    
    private let dataSource = NewsDataSource()
    
    private let presenter: WorldNewsPresenter
    
    @IBOutlet weak var emptyView: EmptyView!
    
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
    
    func registerCells(models: [CustomCellModel]){
        
        models.forEach{
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: nil)
            self.tableView?.register(nib, forCellReuseIdentifier: $0.reuseIdentifier)
        }
        
        self.refreshCells(models: models)
    }
    
    func refreshCells(models: [CustomCellModel]){
        if(models.count < 2){
            self.emptyView.showEmptyView()
            return
        }
        
        self.dataSource.setData(data: models)
        self.tableView.reloadData()
    }
    
    public override func onRefresh() {
        self.presenter.getFreshContent()
        self.refreshControl.beginRefreshing()
    }
   
    func showLoading() {
        if(!self.refreshControl.isRefreshing){
            self.emptyView.showLoading()
        }
    }
    
    func hideLoading() {
        self.emptyView?.hideLoading()
        self.refreshControl.endRefreshing()
    }
    
}

extension WorldNewsViewController: NewsDataSourceDelegate{
    
    func didItemSelected(item: CustomCellModel) {
        
        guard let new: NewsCellModel = item as? NewsCellModel else{
            return
        }
        
        self.navigateToArticleDetail(article: new.article)
    }
    
    private func navigateToArticleDetail(article: Articles){
        let navigator = getApplication().getNavigator()
        let destination = navigator.getArticleDetailScreen(article: article)
        navigator.navigate(from: self, to: destination)
    }
    
}

extension WorldNewsViewController : TabItem{
    
    func getNavBarButton() -> UIBarButtonItem? {
        return createNavItem(title: queryTabItemTitle, selector: "selectQuery")
    }
    
    @objc func selectQuery(){
        self.presentSearchDialog(model: UISearchDialogModel(
            title: queryTabItemTitle,
            subtitle: queryTabItemSubtitle,
            completion: { search in
                self.presenter.setQuery(query: search)
            }))
    }
    
}



