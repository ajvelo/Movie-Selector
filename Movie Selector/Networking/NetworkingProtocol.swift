//
//  NetworkingProtocol.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 24/03/2021.
//

import Foundation

protocol ServiceProtocol {
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void)
}
