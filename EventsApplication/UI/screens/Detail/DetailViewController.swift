//
//  DetailViewController.swift
//  EventsApplication
//
//  Created by ICoon on 03.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

public final class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = DetailDataSource()
    
    private let presenter: DetailPresenter
    
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(presenter: DetailPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "DetailViewController", bundle: Bundle.main)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.tableView.tableFooterView = UIView()
        
        self.presenter.viewDidLoad()
    }
    
    func registerCells(models: [DetailModel]){
        
        models.forEach{
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: nil)
            self.tableView?.register(nib, forCellReuseIdentifier: $0.reuseIdentifier)
        }
        
        self.dataSource.setData(data: models)
        self.tableView.reloadData()
    }
    
}


