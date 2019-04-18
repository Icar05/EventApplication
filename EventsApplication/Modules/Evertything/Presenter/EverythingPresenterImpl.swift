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
        self.view?.showLoading()
        self.interactor.getEverythingByQuery(query: query).asObservable()
            .map{ articles  in
                self.repository.saveArticles(articles: articles)
            }
            .map{ result in
                self.repository.getEverything(query: query)
            }
            .catchError{ error in
                self.view?.handleError(error: error)
                print("Repository error ->  \(error.localizedDescription)")
                
                return Observable.just(self.repository.getEverything(query: query))
            }
            .subscribe(
                onNext: { (articles) in
                    print("Repository hide loading")
                    self.view?.hideLoading()
                    self.view?.updateTableView(articles: articles)
            }).disposed(by: disposeBag)
        
    }
    
    func getEverything(query: String, language: String) {
        self.view?.showLoading()
        self.interactor.getEverythingByLanguage(query: query, language: language)
            .map{ articles  in
                self.repository.saveArticles(articles: articles)
            }
            .map{ result in
                self.repository.getEverything(query: query, language: language)
            }
            .catchError{ error in
                self.view?.handleError(error: error)
                print("Repository error ->  \(error.localizedDescription)")
                
                return Observable.just(self.repository.getEverything(query: query, language: language))
            }
            .subscribe(
                onNext: { (articles) in
                    print("Repository hide loading")
                    self.view?.hideLoading()
                    self.view?.updateTableView(articles: articles)
            }).disposed(by: disposeBag)
        
    }
    
}
