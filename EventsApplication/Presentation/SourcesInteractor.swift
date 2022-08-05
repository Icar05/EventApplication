//
//  SourcesInteractorImpl.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

class SourcesInteractor {
    
    
    private let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getSourcesByCategory(category: String) -> Observable<[Sources]> {
        return self.repository.loadSourcesByCategory(category:category)
    }
    
    
}
