//
//  APIService.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 24/03/2021.
//

import Alamofire
import Foundation

fileprivate let api_key = "c70adf12d2fd7e4e257a833db67fbc87"
fileprivate let api_url_base = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key="
let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/original/"

class APIService : ServiceProtocol {
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        loadDataByAlamofire(completion)
    }
    
    private func loadDataNormal(_ completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "\(api_url_base)\(api_key)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let movies = try? JSONDecoder().decode(MovieList.self, from: data) else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(movies.results)
            }
        }.resume()
    }
    
    private func loadDataByAlamofire(_ completion: @escaping ([Movie]?) -> Void) {
        AF.request("\(api_url_base)\(api_key)")
            .responseJSON{ response in
                guard let data = response.data else {
                    completion(nil)
                    return
                }
                guard let movies = try? JSONDecoder().decode(MovieList.self, from: data) else {
                    completion(nil)
                    return
                }
                DispatchQueue.main.async {
                    completion(movies.results)
                }
        }
    }
}
