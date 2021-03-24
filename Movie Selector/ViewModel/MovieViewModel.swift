//
//  MovieViewModel.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 24/03/2021.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies = MovieList(results: [])
    @Published var loading = false

    let service: ServiceProtocol
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func loadData() {
        self.loading = true
        service.fetchPopularMovies { movies in
            self.loading = false
            guard let movies = movies else {
                return
            }
            self.movies.results = movies
        }
    }
}