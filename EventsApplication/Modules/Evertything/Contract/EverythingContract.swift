//
//  EverythingContract.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift


protocol EverythingPresenter: class {
    var view: EverythingView? { get set }
    var interactor: EverythingInteractor! { get set }
    func onViewDidLoad()
    
    func setQuery(query: String)
    
}


protocol EverythingView: class {
    var presenter: EverythingPresenter! { get set }
    
    func handleError(error: Error)
    
    func updateTableView(articles: [Articles])
    
    func showLoading()
    
    func hideLoading()
}

