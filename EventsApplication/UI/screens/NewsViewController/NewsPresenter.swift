//
//  NewsPresenter.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

public final class NewsPresenter{
    
    
    
    private let showLog = false
    
    private let disposeBag = DisposeBag()
    
    private let repository: Repository
    
    private let interactor: HeadersInteractor
    
    private var country: String = ""
    
    unowned var view: NewsViewController!

    
    
    
    public func set(view: NewsViewController) {
        self.view = view
    }
    
    init(interactor: HeadersInteractor, resository: Repository){
        self.interactor = interactor
        self.repository = resository
    }
    
    func viewDidLoad(country: String = ""){
        self.country = country
        self.handleObservable(
            onBegin: {
                self.view?.showLoading()
            },
            onEnd: {models in
                self.view?.hideLoading()
                self.view?.registerCells(models: models)
            },
            query: getQuery())
    }
    
    func getFreshContent(){
        self.handleObservable(
            onBegin: {
                self.view?.showLoading()
            },
            onEnd: {models in
                self.view?.hideLoading()
                self.view?.refreshCells(models: models)
            },
            query: getQuery())
    }
    
    func setCountry(country: String){
        self.country = country
        self.getFreshContent()
    }
    
    private func handleObservable(onBegin: () -> Void,  onEnd:  @escaping (_ models: [CustomCellModel]) -> Void, query: Observable<[Articles]>){
        onBegin()
            query
            .map{ [weak self] articles  in
                let result = self?.repository.saveArticles(articles: articles)
                self?.printLog("Repository input count -> \(articles.count), result of save \(String(describing: result))")
            }
            .map{ [weak self] result in
                self?.getContentFromRepository()
            }
            .catchError{ [weak self] error in
                self?.view?.handleError(error: error)
                self?.printLog("Repository error ->  \(error.localizedDescription)")
                return Observable.just(self?.getContentFromRepository() ?? [])
            }
            .subscribe(
                onNext: { [weak self] (articles) in
                    self?.printLog("Repository hide loading")
                    let cells = self?.prepareCells(article: articles ?? []) ?? []
                    onEnd(cells)
            }).disposed(by: disposeBag)
    }
    
    private func getQuery() -> Observable<[Articles]>{
        if(country.isEmpty){
            return self.interactor.getDefaultHeadlines().asObservable()
        }
        
        return self.interactor.getHeadlinesByCountry(country: country).asObservable()
    }
    
    private func getContentFromRepository() -> [Articles]{
        if(country.isEmpty){
            return self.repository.getHeadlines()
        }
        
        return self.repository.getHeadlines(country: country)
    }
    
    private func prepareCells(article: [Articles]) -> [CustomCellModel]{
        return article.map{ DetailTransparentCellModel(text: $0.title!)}
    }
    
    private func printLog(_ value: String){
        if(showLog){
            print(value)
        }
    }
    
}

