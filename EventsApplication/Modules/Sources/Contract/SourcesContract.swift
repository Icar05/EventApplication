//
//  SourcesContract.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

protocol SourcesPresenter: class {
    var view: SourcesView? { get set }
    var interactor: SourcesInteractor! { get set }
    func onViewDidLoad()
    
    func getSourcesByCategory(category: String)
}

protocol SourcesInteractor: class {
     func getSourcesByCategory(category: String) -> Observable<[Sources]>
}

protocol SourcesView: class {
    var presenter: SourcesPresenter! { get set }
    
    func handleError(error: Error)
    
    func updateTableView(sources: [Sources])
}
