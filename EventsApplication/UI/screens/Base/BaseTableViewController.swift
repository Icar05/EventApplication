//
//  BaseTableViewController.swift
//  EventsApplication
//
//  Created by Eddson on 4/11/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

public class BaseTableViewController: BaseNewsContainer {
    
    
    
    private var emptyView = EmptyView()
    
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupEmptyView()
    }

    
    /*
     empty view
     */
    
    internal func showLoading(tableView: UITableView) {
        self.needRefresh(need: false, tableView: tableView)
        
        self.addEmpyView(tableView: tableView)
        self.emptyView.showLoading()
        self.changeVisibilityOfTVCells(tableView: tableView, needHide: true)
        
    }
    
    internal func handleError(tableView: UITableView,error: Error) {
        self.needRefresh(need: true, tableView: tableView)
        
        DialogHelper.presentErrorDialog(error: error, viewController: self)
        
        if(tableView.numberOfRows(inSection: 0) > 0){
            removeEmptyView(tableView: tableView)
        }else{
            showEmptyView(tableView: tableView)
        }
        self.changeVisibilityOfTVCells(tableView: tableView, needHide: false)
       
    }
    
    internal func showEmptyView(tableView: UITableView) {
        self.needRefresh(need: true, tableView: tableView)
        
        self.addEmpyView(tableView: tableView)
        self.emptyView.showEmptyView()
        self.changeVisibilityOfTVCells(tableView: tableView, needHide: false)
       
    }
    
    internal func hideEmptyView(tableView: UITableView) {
        self.needRefresh(need: true, tableView: tableView)
        
        self.emptyView.hideLoading()
        self.removeEmptyView(tableView: tableView)
        self.changeVisibilityOfTVCells(tableView: tableView, needHide: false)
        
    }
    
    
    /*
     helper methods
     */
    private func changeVisibilityOfTVCells(tableView: UITableView, needHide: Bool){
        let count = tableView.numberOfRows(inSection: 0)
    
        if(count > 0){
            for row in 0...tableView.numberOfRows(inSection: 0) - 1{
                let indexPath = IndexPath(row: row, section: 0)
                tableView.cellForRow(at: indexPath)?.isHidden = needHide
            }
        }
        
    }
    
    private func addEmpyView(tableView: UITableView){
        tableView.backgroundView = emptyView
        tableView.separatorStyle = .none
    }
    
    private func removeEmptyView(tableView: UITableView){
        tableView.backgroundView = nil
        tableView.separatorStyle = .singleLine
    }
    
    private func setupEmptyView(){
        let frame = CGRect(
            x: 0,
            y: 0,
            width: self.view.bounds.size.width,
            height: self.view.bounds.size.height)
        self.emptyView = EmptyView(frame: frame)
        self.emptyView.sizeToFit()
    }
    
    
}
