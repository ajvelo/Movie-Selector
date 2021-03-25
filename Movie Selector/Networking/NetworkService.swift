//
//  NetworkService.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 25/03/2021.
//

import Foundation
import Alamofire
import Combine


protocol NetworkServiceProtocol: class {
    func execute<T: Codable>(_ urlRequest: URLRequestBuilder, model: T.Type, completion: @escaping (Result<T, AFError>) -> Void) -> AnyCancellable
}

extension NetworkServiceProtocol {
    func execute<T: Codable>(_ urlRequest: URLRequestBuilder, model: T.Type, completion: @escaping (Result<T, AFError>) -> Void) -> AnyCancellable {
        
        let requestPublisher = AF.request(urlRequest).publishDecodable(type: T.self)
        let cancellable = requestPublisher
            .subscribe(on: DispatchQueue(label: "Background Queue", qos: .background))
            .receive(on: RunLoop.main)
            .sink { result in
                // https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=c70adf12d2fd7e4e257a833db67fbc87&page=1
                print(result.response)
                if let value = result.value {
                    completion(Result.success(value))
                } else if let error = result.error {
                    completion(Result.failure(error))
                }
            }
        return cancellable
    }
}

class NetworkService: NetworkServiceProtocol {
    public static let `default`: NetworkServiceProtocol = {
        var service = NetworkService()
        return service
    }()
}
