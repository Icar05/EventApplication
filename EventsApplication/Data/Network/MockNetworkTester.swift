//
//  MockNetworkTester.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/02/27.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

class MockNetworkTester{
  
   let disposibleBag = DisposeBag()
    
    let repository: Repository = RepositoryImpl.shared

    // done
    func testGetDefaultHeadlines(){
            repository.loadHeadlines(country: CountryUtil.getDefaultCountry())
                .observeOn(MainScheduler.instance)
                .subscribe(
                   onNext: { (articles) in
                    self.debug(value: "-------------- On NEXT ")
                    self.debugArticles(articles: articles)
                }, onError: { (error) in
                    self.debug(value: "-------------- On onError \(error.localizedDescription)")
                }, onCompleted: {
                    self.debug(value: "-------------- On onCompleted ")
                }, onDisposed: {
                    self.debug(value: "-------------- On onDisposed ")
                }).disposed(by: disposibleBag)

    }


    //done
    func testGetHeadlinesByCountry(country: String){
       repository.loadHeadlines(country: country)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
                self.debug(value: "-------------- On NEXT ")
                self.debugArticles(articles: articles)
            }, onError: { (error) in
                self.debug(value: "-------------- On onError \(error.localizedDescription)")
            }, onCompleted: {
                self.debug(value: "-------------- On onCompleted ")
            }, onDisposed: {
                self.debug(value: "-------------- On onDisposed ")
            }).disposed(by: disposibleBag)

    }



    func testtGetEverythingByQuery(query: String){
            repository.loadEverything(query: query)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (articles) in
                self.debug(value: "-------------- On NEXT ")
                self.debugArticles(articles: articles)
            }, onError: { (error) in
                self.debug(value: "-------------- On onError \(error.localizedDescription)")
            }, onCompleted: {
                self.debug(value: "-------------- On onCompleted ")
            }, onDisposed: {
                self.debug(value: "-------------- On onDisposed ")
            }).disposed(by: disposibleBag)

    }



    func testGetSourcesByCategory(category: String){
            repository.loadSourcesByCategory(category: category)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (sources) in
                self.debug(value: "-------------- On NEXT ")
                self.debugSources(sources: sources)
            }, onError: { (error) in
                self.debug(value: "-------------- On onError \(error.localizedDescription)")
            }, onCompleted: {
                self.debug(value: "-------------- On onCompleted ")
            }, onDisposed: {
                self.debug(value: "-------------- On onDisposed ")
            }).disposed(by: disposibleBag)

    }

    func debugSources(sources: [Sources]){
        for source: Sources in sources{
            self.debug(value: "\(String(describing: source.name)) \n")
            self.debug(value: "\(String(describing: source.url))\n" )
            self.debug(value: "\(String(describing: source.category))\n " )
            self.debug(value: "-------------- \n")
        }
    }

    func debugArticles(articles: [Articles]){
        for article: Articles in articles{
            self.debug(value: "\(String(describing: article.title)) \n")
            self.debug(value: "\(String(describing: article.description))\n" )
            self.debug(value: "\(String(describing: article.publishedAt))\n " )
            self.debug(value: "-------------- \n")
        }
    }

    func debug(value: String){
        print("MockNetworkTester: \(value)")
    }

}
