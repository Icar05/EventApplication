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
    
    public override func onRefresh() {
        self.presenter.getFreshContent()
        self.refreshControl.beginRefreshing()
    }
   
}

extension SourcesViewController: NewsVC{
    
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

extension SourcesViewController: NewsDataSourceDelegate{
    
    func didItemSelected(item: CustomCellModel) {
        
        guard let source: SourcesCellModel = item as? SourcesCellModel else{
            return
        }
        
        self.navigateToSourceDetail(source: source.source)
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
            currentSelection: presenter.getCategory(),
            completion: { category in
                self.presenter.setCategory(category: category)
            }
        ))
    }
}

