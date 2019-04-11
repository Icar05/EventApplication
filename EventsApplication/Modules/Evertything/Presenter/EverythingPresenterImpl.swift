//
//  EverythingPresenterImpl.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift


class EverythingPresenterImpl {
    
    let disposeBag = DisposeBag()
    var view: EverythingView?
    var interactor: EverythingInteractor!
    var query: String = ValueForSelector.defaultQuery
    var language: String? = nil
    
    
    
    
    func onViewDidLoad() {
        self.language == nil ?
        self.getEverything(query: query) :
        self.getEverything(query: query, language: language!)
        
        print("presenter refersh -> Everything presenter reload!")
    }
}
extension EverythingPresenterImpl : EverythingPresenter{
    
    
    func setLanguage(language: String) {
        self.language = language
        self.query = ValueForSelector.defaultQuery
        self.getEverything(query: query, language: language)
    }
    
    func setQuery(query: String) {
        self.query = query.isEmpty ? ValueForSelector.defaultQuery: query
        self.language = nil
        self.getEverything(query: query)
    }
    
    
    func getEverything(query: String) {
        self.view?.showLoading()
        self.interactor
            .getEverythingByQuery(query: query)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
                self.view?.hideLoading()
                self.view?.updateTableView(articles: articles)
            }, onError: { (error) in
                self.view?.hideLoading()
                self.view?.handleError(error: error)
            }).disposed(by: disposeBag)
    }
    
    func getEverything(query: String, language: String) {
        self.view?.showLoading()
        self.interactor
            .getEverythingByLanguage(query: query, language: language)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
                self.view?.hideLoading()
                self.view?.updateTableView(articles: articles)
            }, onError: { (error) in
                self.view?.hideLoading()
                self.view?.handleError(error: error)
            }).disposed(by: disposeBag)
        
    }
    
}
