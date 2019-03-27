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
        NetworkServiceRx.shared
            .getDefaultHeadlines()
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
//                    self.debug(value: "-------------- On NEXT ")
//                    self.debugArticles(articles: articles)
            }, onError: { (error) in
//                self.debug(value: "-------------- On onError \(error.localizedDescription)")
            }, onCompleted: {
//                self.debug(value: "-------------- On onCompleted ")
            }, onDisposed: {
//                self.debug(value: "-------------- On onDisposed ")
            }).disposed(by: disposeBag)
    }
    
    func getHeadlinesByCountry(country: String) {
        NetworkServiceRx.shared
            .getHeadlinesByCountry(country: country)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
//                    self.debug(value: "-------------- On NEXT ")
//                    self.debugArticles(articles: articles)
            }, onError: { (error) in
//                self.debug(value: "-------------- On onError \(error.localizedDescription)")
            }, onCompleted: {
//                self.debug(value: "-------------- On onCompleted ")
            }, onDisposed: {
//                self.debug(value: "-------------- On onDisposed ")
            }).disposed(by: disposeBag)
    }
    
    func getHeadlinesByCategory(category: String) {
        NetworkServiceRx.shared
            .getHeadlinesByCategory(category: category)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
//                    self.debug(value: "-------------- On NEXT ")
//                    self.debugArticles(articles: articles)
            }, onError: { (error) in
//                self.debug(value: "-------------- On onError \(error.localizedDescription)")
            }, onCompleted: {
//                self.debug(value: "-------------- On onCompleted ")
            }, onDisposed: {
//                self.debug(value: "-------------- On onDisposed ")
            }).disposed(by: disposeBag)
    }
    
    
}

