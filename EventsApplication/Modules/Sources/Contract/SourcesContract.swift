//
//  SourcesContract.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation


protocol SourcesPresenter: class {
    var view: SourcesView? { get set }
    var interactor: SourcesInteractor! { get set }
    func onViewDidLoad()
}

protocol SourcesInteractor: class {}

protocol SourcesView: class {
    var presenter: SourcesPresenter! { get set }
}
