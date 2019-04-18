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
    var country = ""
    let repository = RepositoryImpl.shared
    
    
    
    func onViewDidLoad() {
            if(!country.isEmpty){
                self.getHeadlines(country: country)
            }else{
                self.getHeadlines()
            }
        
        print("presenter refersh -> Header presenter reload!")
    }
}

extension HeaderPresenterImpl : HeaderPresenter{
    
    func setCountry(country: String) {
        self.country = country
        self.getHeadlines(country: country)
    }
    
    
    
    
    
    func getHeadlines() {
        self.view?.showLoading()
        self.interactor.getDefaultHeadlines().asObservable()
            .map{ articles  in
                print("Repository input count -> \(articles.count)")
                self.repository.saveArticles(articles: articles)
            }
            .map{ result in
                self.repository.getHeadlines()
            }
            .catchError{ error in
                self.view?.handleError(error: error)
                print("Repository error ->  \(error.localizedDescription)")
                
                return Observable.just(self.repository.getHeadlines())
            }
            .subscribe(
                onNext: { (articles) in
                    print("Repository hide loading")
                    self.view?.hideLoading()
                    self.view?.updateTableView(articles: articles)
            }).disposed(by: disposeBag)
    }
    
    func getHeadlines(country: String) {
        self.view?.showLoading()
        self.interactor.getHeadlinesByCountry(country: country).asObservable()
            .map{ articles  in
                print("Repository input count -> \(articles.count)")
                self.repository.saveArticles(articles: articles)
            }
            .map{ result in
                self.repository.getHeadlines(country: country)
            }
            .catchError{ error in
                self.view?.handleError(error: error)
                print("Repository error ->  \(error.localizedDescription)")
                
                return Observable.just(self.repository.getHeadlines(country: country))
            }
            .subscribe(
                onNext: { (articles) in
                    print("Repository hide loading")
                    self.view?.hideLoading()
                    self.view?.updateTableView(articles: articles)
            }).disposed(by: disposeBag)
    }

    
}

