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
    
    
    
    func onViewDidLoad() {
            if(!country.isEmpty){
                self.getHeadlines(country: country)
            }else if(!category.isEmpty){
                self.getHeadlines(category: category)
            }else{
                self.getHeadlines()
            }
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
       self.view?.showLoading()
       self.interactor
            .getDefaultHeadlines()
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
    
    func getHeadlines(country: String) {
        self.view?.showLoading()
        self.interactor
            .getHeadlinesByCountry(country: country)
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
    
    func getHeadlines(category: String) {
        self.view?.showLoading()
        self.interactor
            .getHeadlinesByCategory(category: category)
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

