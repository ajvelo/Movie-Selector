//
//  MockService.swift
//  Movie SelectorTests
//
//  Created by Andreas Velounias on 24/03/2021.
//

import Foundation

@testable import Movie_Selector

class MockService : ServiceProtocol {
    let mockData: [Movie]?
    
    init(mockData: [Movie]?) {
        self.mockData = mockData
    }
    
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        completion(mockData)
    }
}
