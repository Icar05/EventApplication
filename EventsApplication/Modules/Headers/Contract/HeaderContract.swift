//
//  HeaderContract.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

protocol HeaderPresenter: class {
    var view: HeaderView? { get set }
    var interactor: HeadersInteractor! { get set }
    func onViewDidLoad()
    
    func getDefaultHeadlines()
    
    func getHeadlinesByCountry(country: String)
    
    func getHeadlinesByCategory(category: String)
}

protocol HeadersInteractor: class {
    
    func getDefaultHeadlines() -> Observable<[Articles]>
    
    func getHeadlinesByCountry(country: String) -> Observable<[Articles]>
    
    func getHeadlinesByCategory(category: String) -> Observable<[Articles]>
}

protocol HeaderView: class {
    
    var presenter: HeaderPresenter! { get set }
    
    func handleError(error: Error)
    
    func updateTableView(articles: [Articles])
    
    func showLoading()
    
    func hideLoading()
}
