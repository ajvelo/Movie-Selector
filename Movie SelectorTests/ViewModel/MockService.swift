//
//  MockService.swift
//  Movie SelectorTests
//
//  Created by Andreas Velounias on 24/03/2021.
//

import Foundation
import Combine
import Alamofire

@testable import Movie_Selector

class MockService : NetworkServiceProtocol {
    let mockData: [Movie]?
    
    init(mockData: [Movie]?) {
        self.mockData = mockData
    }
    
    func execute<T: Codable>(_ urlRequest: URLRequestBuilder, model: T.Type, completion: @escaping (Result<T, AFError>) -> Void) -> AnyCancellable {
        let requestPublisher = AF.request(urlRequest).publishDecodable(type: T.self)
        let cancellable = requestPublisher
            .subscribe(on: DispatchQueue(label: "Background Queue", qos: .background))
            .receive(on: RunLoop.main)
            .sink { result in
                if let value = result.value {
                    completion(Result.success(value))
                } else if let error = result.error {
                    completion(Result.failure(error))
                }
            }
        return cancellable
    }
    
    func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        completion(mockData)
    }
}
