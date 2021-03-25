//
//  MoviesAPI.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 25/03/2021.
//

import Foundation
import Alamofire

enum MoviesAPIs: URLRequestBuilder {
    case fetchPopularMovies(Int)
}

extension MoviesAPIs {
    var path: String {
        switch self {
        case .fetchPopularMovies:
            return Constants.FETCH_POPULAR_MOVIES_PATH
        }
    }
    
    var parameters: Parameters? {
            switch self {
            case .fetchPopularMovies(let page):
                return ["api_key": Constants.API_KEY,
                        "page": page
                ]
            }
        }
    
    var method: HTTPMethod {
            switch self {
            case .fetchPopularMovies:
                return HTTPMethod.get
            }
        }
}
