//
//  ArticleDetailContract.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

protocol ArticleDetailPresenter: class {
    var view: ArticleDetailView? { get set }
    var interactor: ArticleDetailInteractor! { get set }
    func onViewDidLoad()
}

protocol ArticleDetailInteractor: class {
}

protocol ArticleDetailView: class {
    var presenter: ArticleDetailPresenter! { get set }
}
