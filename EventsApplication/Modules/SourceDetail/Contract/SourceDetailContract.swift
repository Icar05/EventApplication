//
//  SourceDetailContract.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//


import Foundation

protocol SourceDetailPresenter: class {
    var view: SourceDetailView? { get set }
    var interactor: SourceDetailInteractor! { get set }
    func onViewDidLoad()
}

protocol SourceDetailInteractor: class {
}

protocol SourceDetailView: class {
    var presenter: SourceDetailPresenter! { get set }
}
