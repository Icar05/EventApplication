//
//  SourcesViewController.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

public final class SourcesViewController: BaseTableViewController {
    

    private let categoryTabItemTitle = NSLocalizedString("Category", comment: "")
    
    private let categoryTabItemSubtitle = NSLocalizedString("Select category", comment: "")
    
    private let dataSource = NewsDataSource()
    
    private let presenter: SourcesPresenter
    
    @IBOutlet weak var emptyView: EmptyView!
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(presenter: SourcesPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "SourcesViewController", bundle: Bundle.main)
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

extension SourcesViewController: NewsDataSourceDelegate{
    
    func didItemSelected(item: CustomCellModel) {
        
        guard let source: SourcesCellModel = item as? SourcesCellModel else{
            return
        }
        
        self.navigateToSourceDetail(source: source.source)
    }
    
    private func navigateToSourceDetail(source: Sources){
        let navigator = getApplication().getNavigator()
        let destination = navigator.getSourceDetailScreen(sources: source)
        navigator.navigate(from: self, to: destination)
    }
    
}

extension SourcesViewController : TabItem{
    
    func getNavBarButton() -> UIBarButtonItem? {
        return createNavItem(title: categoryTabItemTitle, selector: "selectCategory")
    }
    
    @objc func selectCategory(){
        self.presentSelectionDialog(model: UISelectionDialogModel(
            title: categoryTabItemTitle,
            subtitle: categoryTabItemSubtitle,
            dataSourse:ValueForSelector.categories,
            completion: { category in
                self.presenter.setCategory(category: category)
            }
        ))
    }
    
}

