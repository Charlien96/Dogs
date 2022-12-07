//
//  RequestError.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
}
