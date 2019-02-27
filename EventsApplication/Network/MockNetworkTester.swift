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
    
    
    func testSearchEventByKeyword(){
            NetworkServiceRx.shared
                .searchEventByKeyword(keyword: "oktoberfest")
                .observeOn(MainScheduler.instance)
                .subscribe(
                   onNext: { (n) in
                    print("-------------- On NEXT ")
                }, onError: { (error) in
                    print("-------------- On onError ")
                }, onCompleted: {
                    print("-------------- On onCompleted ")
                }, onDisposed: {
                    print("-------------- On onDisposed ")
                }).disposed(by: disposibleBag)
        
    }
    
    func searchEventsByCity(){
        
    }
    
    func searchEventByCityAndName(){
        
    }
    
    
    
}
