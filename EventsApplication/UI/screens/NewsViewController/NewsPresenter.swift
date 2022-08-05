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
        self.country = CountryUtil.getDefaultCountry()
    }
    
    func viewDidLoad(){
        self.loadContent(
            onEnd: { models in
                self.view?.registerCells(models: models)
            })
    }
    
    func getFreshContent(){
        self.loadContent(
            onEnd: { models in
                self.view?.refreshCells(models: models)
            })
    }
    
    func setCountry(country: String){
        self.country = country
        self.getFreshContent()
    }
    
    private func loadContent(onEnd:  @escaping (_ models: [CustomCellModel]) -> Void){
            self.view?.showLoading()
            self.interactor.getHeadlinesByCountry(country: country).asObservable()
            .map{ [weak self] articles  in
                let result = self?.repository.saveArticles(articles: articles)
                self?.printLog("Repository input count -> \(articles.count), result of save \(String(describing: result))")
            }
            .map{ [weak self] result in
                self?.getHeaders()
            }        
            .catchError{ [weak self] error in
                self?.view?.handleError(error: error)
                self?.printLog("Repository error ->  \(error.localizedDescription)")
                return Observable.just(self?.getHeaders() ?? [])
            }
            .subscribe(
                onNext: { [weak self] (articles) in
                    self?.printLog("Repository hide loading")
                    let cells = self?.prepareCells(article: articles ?? []) ?? []
                    self?.view?.hideLoading()
                    onEnd(cells)
            }).disposed(by: disposeBag)
    }
    
    private func getHeaders() -> [Articles]{
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

