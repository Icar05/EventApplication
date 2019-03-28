//
//  HeaderPresenterImpl.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift



class HeaderPresenterImpl {
    
    let disposeBag = DisposeBag()
    
    var view: HeaderView?
    
    var interactor: HeadersInteractor!
    
    func onViewDidLoad() {
        
    }
}

extension HeaderPresenterImpl : HeaderPresenter{
    
    func getDefaultHeadlines() {
       self.interactor
            .getDefaultHeadlines()
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
                    self.view?.updateTableView(articles: articles)
            }, onError: { (error) in
                    self.view?.handleError(error: error)
            }).disposed(by: disposeBag)
    }
    
    func getHeadlinesByCountry(country: String) {
        self.interactor
            .getHeadlinesByCountry(country: country)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
                self.view?.updateTableView(articles: articles)
            }, onError: { (error) in
                self.view?.handleError(error: error)
            }).disposed(by: disposeBag)
    }
    
    func getHeadlinesByCategory(category: String) {
        self.interactor
            .getHeadlinesByCategory(category: category)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
                self.view?.updateTableView(articles: articles)
            }, onError: { (error) in
                self.view?.handleError(error: error)
            }).disposed(by: disposeBag)
    }
    
    
}

