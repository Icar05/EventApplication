//
//  NewsDataSource.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

protocol NewsDataSourceDelegate: NSObject{
    func didItemSelected(item: CustomCellModel)
}

final class NewsDataSource : NSObject, UITableViewDataSource, UITableViewDelegate{

    
    
    private var data: [CustomCellModel] = []
    
    weak var delegate: NewsDataSourceDelegate? = nil
    
    func setData(data: [CustomCellModel]){
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let model = data[indexPath.row]
        let id = model.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)  as! CustomCell
            cell.update(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didItemSelected(item: data[indexPath.row])
    }
    
}


