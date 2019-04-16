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
    var repository = RepositoryImpl.shared
    
    
    
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
        self.makeRequest(
            fromNetwork: interactor.getEverythingByQuery(query: query),
            fromRepo: repository.getEverything(query: query))
    }
    
    func getEverything(query: String, language: String) {
        self.makeRequest(
            fromNetwork: interactor.getEverythingByLanguage(query: query, language: language),
            fromRepo: repository.getEverything(query: query, language: language))
    }
    
    
    fileprivate func makeRequest(fromNetwork: Observable<[Articles]>, fromRepo: Observable<[Articles]>){
        
            self.view?.showLoading()
                fromNetwork
                .flatMap{ articles -> Observable<[Articles]> in
                    let success = self.repository.saveArticles(articles: articles)
                    print("Repository data stored :\(success)")
                    return fromRepo
                }
                .catchError{
                    error in self.view?.handleError(error: error)
                    print("Repository error ->  \(error.localizedDescription)")
                    return fromRepo
                }
                .observeOn(MainScheduler.instance)
                .subscribe(
                    onNext: { (articles) in
                        self.view?.hideLoading()
                        self.view?.updateTableView(articles: articles)
                }).disposed(by: disposeBag)
    }
    
}
