//
//  URLRequest+Extension.swift
//  Dogs
//
//  Created by Charles on 07/12/22.
//

import Foundation

extension URLRequest {
    static func getRequest(endpoint: Endpoint)-> URLRequest? {
        
        guard endpoint.path.count > 0 else {
            return nil
        }
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        return request
    }
}
