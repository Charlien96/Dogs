//
//  JsonParser.swift
//  Dogs
//
//  Created by Charles on 07/12/22.
//

import Foundation

protocol JsonParser {
    func decode<T: Decodable>(data: Data, responseModel: T.Type)throws -> T
}

extension JsonParser {
    func decode<T: Decodable>(data: Data, responseModel: T.Type)throws -> T {
        guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
            throw RequestError.decode
        }
        return decodedResponse
    }
}
