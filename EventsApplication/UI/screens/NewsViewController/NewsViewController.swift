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
        print("TEMP -> refreshCells: \(models.count)")
        self.dataSource.setData(data: models)
        self.tableView.reloadData()
    }
    
    public override func onRefresh() {
        #warning("handle it")
        print("TEMP -> onRefresh")
    }
   
    func showLoading() {
        #warning("handle it")
//        self.emptyView?.showLoading()
        print("TEMP -> showLoading")
    }
    
    func hideLoading() {
        #warning("handle it")
//        self.emptyView?.hideLoading()
        print("TEMP -> hideLoading")
    }
    
}

extension NewsViewController: NewsDataSourceDelegate{
    
    func didItemSelected(item: CustomCellModel) {
       let text =  (item as? DetailTransparentCellModel)?.text
        print("TEMP ->  text: \(String(describing: text))")
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




