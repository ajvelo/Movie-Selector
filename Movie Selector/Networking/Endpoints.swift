//
//  Endpoints.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 25/03/2021.
//

import Foundation

enum Endpoints {
    case fetchPopularMovies(Int)
}

extension Endpoints {
    
    func resolve() -> URLRequestBuilder {
        switch self {
        case .fetchPopularMovies(let page):
            return MoviesAPIs.fetchPopularMovies(page)
        }
    }
}
