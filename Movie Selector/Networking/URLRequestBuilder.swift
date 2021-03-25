//
//  URLRequestBuilder.swift
//  Movie Selector
//
//  Created by Andreas Velounias on 25/03/2021.
//

import Foundation
import Alamofire


protocol URLRequestBuilder: URLRequestConvertible {
    var baseURL: URL { get }
    var requestURL: URL { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var urlRequest: URLRequest { get }
}

extension URLRequestBuilder {
    
    var baseURL: URL {
        return URL(string: Constants.BASE_URL)!
    }
    
    var requestURL: URL {
//        return baseURL.appendingPathComponent(path, isDirectory: false)
        return URL(string: Constants.BASE_URL+Constants.FETCH_POPULAR_MOVIES_PATH)!
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return NOURLEncoding()
        default:
            return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        let header = HTTPHeaders()
        return header
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.name)
        }
        return request
    }
    
    public func asURLRequest() throws -> URLRequest {
//        return try encoding.encode(urlRequest, with: parameters)
        return try encoding.encode(urlRequest, with: parameters)
//        return urlRequest
    }
}
