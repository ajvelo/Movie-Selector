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

    private var bag: [AnyCancellable] = []
    let networkService: NetworkServiceProtocol
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func load() {
            self.networkService
                .execute(Endpoints.fetchPopularMovies(1).resolve(), model: MovieList.self) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let response):
                        print(response)
                        self.movies.results = response.results
//                        self.movies.append(contentsOf: response.movies)
                        
                    case .failure(let error):
                        print(error.localizedDescription)
//                        self.state = .failed(error.localizedDescription)
                    }
                }.store(in: &bag)
        }
}
