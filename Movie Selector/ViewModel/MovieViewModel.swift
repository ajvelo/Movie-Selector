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
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func load(page: Int) {
            self.networkService
                .execute(Endpoints.fetchPopularMovies(page).resolve(), model: MovieList.self) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let response):
                        self.movies.results = response.results
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }.store(in: &bag)
        }
}
