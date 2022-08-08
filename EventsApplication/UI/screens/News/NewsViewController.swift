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
    
    
    
    private let dataSource = NewsDataSource()
    
    private let presenter: NewsPresenter
    
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
    
    public override func onRefresh() {
        self.presenter.getFreshContent()
        self.refreshControl.beginRefreshing()
    }
    
    
}

extension NewsViewController: NewsVC{
    
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

extension NewsViewController: NewsDataSourceDelegate{
    
    func didItemSelected(item: CustomCellModel) {
        
        guard let new: NewsCellModel = item as? NewsCellModel else{
            return
        }
        
        self.navigateToArticleDetail(article: new.article)
    }
    
}

extension NewsViewController: TabItem{
    
    func getRightNavBarButton() -> UIBarButtonItem? {
        return createNavItem(title: Translations.General.Country, selector: "selectCountry")
    }
    
    func getLeftNavBarButton() -> UIBarButtonItem? {
        return createNavItem(title: Translations.General.ClearSelection, selector: "clearAction")
    }
    
    @objc func clearAction(){
        self.presenter.clearCountry()
    }
    
    @objc func selectCountry(){
        self.presentSelectionDialog(model: UISelectionDialogModel(
            title: Translations.General.Country,
            subtitle: Translations.General.SelectCountry,
            dataSourse: ValueForSelector.countries,
            currentSelection: presenter.getCountry(),
            completion: { country in
                self.presenter.setCountry(country: country)
            }))
    }
    
}
