//
//  HTTPClientTests.swift
//  DogsTests
//
//  Created by Charles on 07/12/22.
//

import XCTest
@testable import Dogs

final class HTTPClientTests: XCTestCase {

    func test_when_urlRequest_is_invalid() async {
        let networkClient = NetworkClient()
           let result =  await networkClient.sendRequest(endpoint: MockEndPoint(path:"test", method: .get), responseModel: BreedResponse.self)
      
        switch result {
        case .success(_):
            print()
        case .failure(let error):
            XCTAssertEqual(error , RequestError.invalidURL)
        }
    }
}
