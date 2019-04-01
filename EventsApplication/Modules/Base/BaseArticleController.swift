//
//  BaseArticleController.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class BaseArticleController: UIViewController {
    
     let refreshControl = UIRefreshControl()
    
     let cellIndifier = "ArticleCell"
    
     var datasource: [Articles] = []
    
    
}

extension BaseArticleController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndifier) as! ArticleCell
            cell.fillCell(article: datasource[indexPath.row])
        
        return cell
    }
    
}

extension BaseArticleController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        Router.presentArticleDetailController(current: self, article: datasource[indexPath.row])
        
        
//        MyModalViewController *modalViewController = [[MyModalViewController alloc] init];
//        modalViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//        [self presentViewController:modalViewController animated:YES completion:nil];
        
        
        
        let dialogStoryboard = UIStoryboard(name: "SelectionDialog", bundle: nil)
        let customAlert = dialogStoryboard.instantiateViewController(withIdentifier: "UISelectionDialog") as! UISelectionDialog
        
//          let customAlert = UISelectionDialog()
            customAlert.providesPresentationContextTransitionStyle = true
            customAlert.definesPresentationContext = true
            customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        customAlert.delegate = self
            self.present(customAlert, animated: true, completion: nil)
//        current?.navigationController?.pushViewController(sourcesDetailViewController, animated: true)
        
    }
}
