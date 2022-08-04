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
        self.handleObservable(query: getQuery())
    }
    
    private func getQuery() -> Observable<[Articles]>{
        if(country.isEmpty){
            return self.interactor.getDefaultHeadlines().asObservable()
        }
        
        return self.interactor.getHeadlinesByCountry(country: country).asObservable()
    }
    
    private func handleObservable(query: Observable<[Articles]>){
        self.view?.showLoading()
            query
            .map{ articles  in
                let result = self.repository.saveArticles(articles: articles)
                print("Repository input count -> \(articles.count), result of save \(result)")
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
                    self.view?.registerCells(models: self.prepareCells(article: articles))
            }).disposed(by: disposeBag)
    }
    
    private func prepareCells(article: [Articles]) -> [CustomCellModel]{
        return article.map{ DetailTransparentCellModel(text: $0.title!)}
    }
    
}

