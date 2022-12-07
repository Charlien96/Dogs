//
//  HTTPClient.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import Foundation

protocol HTTPClient: JsonParser {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async -> Result<T, RequestError> {
        
        guard let request = URLRequest.getRequest(endpoint: endpoint) else {
            return .failure(RequestError.invalidURL)
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            
            do {
                try response.validateResponse()
                let decodedResponse = try decode(data: data, responseModel: responseModel)
                return .success(decodedResponse)
            }catch {
                return .failure(error as! RequestError)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
