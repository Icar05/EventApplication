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
    var category = ""
    var country = ""
    let repository = RepositoryImpl.shared
    
    
    
    func onViewDidLoad() {
            if(!country.isEmpty){
                self.getHeadlines(country: country)
            }else if(!category.isEmpty){
                self.getHeadlines(category: category)
            }else{
                self.getHeadlines()
            }
        
        print("presenter refersh -> Header presenter reload!")
    }
}

extension HeaderPresenterImpl : HeaderPresenter{
    
    
    func setCategory(category: String) {
        self.category = category
        self.country = ""
        self.getHeadlines(category: category)
    }
    
    func setCountry(country: String) {
        self.country = country
        self.category = ""
        self.getHeadlines(country: country)
    }
    
    
    
    
    
    func getHeadlines() {
        self.makeRequest(
            fromNetwork: self.interactor.getDefaultHeadlines(),
            fromRepo: self.repository.getHeadlines())
    }
    
    func getHeadlines(country: String) {
        self.makeRequest(
            fromNetwork: self.interactor.getHeadlinesByCountry(country: country),
            fromRepo: self.repository.getHeadlines(country: country))
    }
    
    func getHeadlines(category: String) {
        self.makeRequest(
            fromNetwork: self.interactor.getHeadlinesByCategory(category: category),
            fromRepo: self.repository.getHeadlines(category: category))
    }
    
    
    func makeRequest(fromNetwork: Observable<[Articles]>, fromRepo: Observable<[Articles]>){
        
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

