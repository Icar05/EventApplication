//
//  NewsViewController.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit


/**
 private let categoryTabItemTitle = NSLocalizedString("Category", comment: "")
 
 private let categoryTabItemSubtitle = NSLocalizedString("Select category", comment: "")
 */
public final class NewsViewController: BaseTableViewController {
    
    
    
    
    
    private let countryTabItemTitle = NSLocalizedString("Country", comment: "")
    
    private let countryTabItemSubtitle = NSLocalizedString("Select country", comment: "")
    
    private let dataSource = NewsDataSource()
    
    private let presenter: NewsPresenter
    
    @IBOutlet weak var emptyView: EmptyView!
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    
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
        
        print("is Empty: \(models.isEmpty), count: \(models.count)")
        
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

extension NewsViewController: NewsDataSourceDelegate{
    
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

extension NewsViewController: TabItem{
    
    
    func getNavBarButton() -> UIBarButtonItem? {
        return createNavItem(title: countryTabItemTitle, selector: "selectCountry")
    }
    
    
    @objc func selectCountry(){
        self.presentSelectionDialog(model: UISelectionDialogModel(
            title: countryTabItemTitle,
            subtitle: countryTabItemSubtitle,
            dataSourse: ValueForSelector.countries,
            completion: { country in
                self.presenter.setCountry(country: country)
            }))
    }
    
}




