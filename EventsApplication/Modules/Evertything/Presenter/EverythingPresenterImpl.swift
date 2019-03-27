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
    
    func onViewDidLoad() {
        
    }
}
extension EverythingPresenterImpl : EverythingPresenter{
    
    func getEverythingByQuery(query: String) {
        NetworkServiceRx.shared
            .getEverythingByQuery(query: query)
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
    
    func getEverythingByLanguage(query: String, language: String) {
        NetworkServiceRx.shared
            .getEverythingByLanguage(query: query, language: language)
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
