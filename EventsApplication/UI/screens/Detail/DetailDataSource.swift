//
//  DetailDataSource.swift
//  EventsApplication
//
//  Created by ICoon on 03.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

protocol DetailModel{
    var reuseIdentifier: String { get }
}

protocol DetailCell: UITableViewCell {
    func update(with model: DetailModel)
}

final class DetailDataSource : NSObject, UITableViewDataSource, UITableViewDelegate{

    private var data: [DetailModel] = []
    
    func setData(data: [DetailModel]){
        self.data = data
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let model = data[indexPath.row]
        let id = model.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)  as! DetailCell
            cell.update(with: model)

        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
}


