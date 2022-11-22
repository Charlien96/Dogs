//
//  URLResponse+Extension.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import Foundation

extension URLResponse {
    func validateResponse()throws {
        guard let response = self as? HTTPURLResponse else {
            throw RequestError.noResponse
        }
        switch response.statusCode {
        case 200...299:
            return
        case 401:
            throw RequestError.unauthorized
        default:
            throw RequestError.unexpectedStatusCode
        }
    }
}
