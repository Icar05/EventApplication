//
//  SourcesInteractorImpl.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

class SourcesInteractorImpl: SourcesInteractor {
    
    
    func getSourcesByCategory(category: String) -> Observable<[Sources]> {
        return RepositoryImpl.shared.loadSourcesByCategory(category:category)
    }
    
    
}
