//
//  NewsPresenter.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

public final class NewsPresenter{
    
    
    
    private let showLog = true
    
    private let disposeBag = DisposeBag()
    
    private let repository: Repository
    
    private let interactor: HeadersInteractor
    
    private var country: String = ""
    
    unowned var view: NewsVC!

    
    
    
    public func set(view: NewsVC) {
        self.view = view
    }
    
    init(interactor: HeadersInteractor, resository: Repository){
        self.interactor = interactor
        self.repository = resository
        self.country = CountryUtil.getDefaultCountry()
    }
    
    
    func viewDidLoad(){
        self.loadContent()
    }
    
    func getFreshContent(){
        self.loadContent()
    }
    
    func setCountry(country: String){
        self.country = country
        self.getFreshContent()
    }
    
    
    
    private func loadContent(){
        self.view?.showLoading()
        
        self.interactor.getHeadlinesByCountry(country: country).asObservable()
            .map{ [weak self] articles  in
                self?.saveNews(articles: articles)
            }
            .map{ [weak self] result in
                self?.getHeaders() ?? []
            }
            .catchError{ [weak self] error in
                return Observable.just(self?.handleError(error: error) ?? [])
            }
            .subscribe(
                onNext: { [weak self] (articles) in
                    self?.handleArticles(arcicles: articles)
            })
            .disposed(by: disposeBag)
    }
    
    
    private func handleError(error: Error) -> [Articles]{
        self.view.handleError(error: error)
        return getHeaders()
    }
    
    private func handleArticles(arcicles: [Articles]){
        if(arcicles.count > 0){
            self.view.updateContent(cells: prepareCells(article: arcicles))
        }else{
            self.view.showEmptyView()
        }
    }
    
    private func saveNews(articles: [Articles]) -> Bool {
        return repository.saveArticles(articles: articles)
    }
    
    private func getHeaders() -> [Articles]{
        return self.repository.getHeadlines(country: country)
    }
    
    private func prepareCells(article: [Articles]) -> [CustomCellModel]{
        var cells: [CustomCellModel] = [NewsSeparatorCellModel()]
            article.forEach{
                cells.append(NewsCellModel(article: $0))
                cells.append(NewsSeparatorCellModel())
            }
        
       return cells
    }
    
    private func printLog(_ value: String){
        if(showLog){
            print(value)
        }
    }
    
}

