//
//  TestURLResponse.swift
//  DogsTests
//
//  Created by Charles on 11/11/2022.
//

import XCTest
@testable import Dogs

final class URLResponseTests: XCTestCase {

    
    func testUnKnownResponse() throws {
        
       let urlResponse =  URLResponse(url: URL(string: "test")!, mimeType: nil, expectedContentLength: 1, textEncodingName: "json")
        do {
            try urlResponse.validateResponse()
        }catch {
            XCTAssertEqual(error as! RequestError, RequestError.noResponse)
        }
    }
    
    func testResponseCode200() throws {
        let urlResponse =  HTTPURLResponse(url: URL(string: "test")!, statusCode: 400, httpVersion:"1", headerFields: [:])
        do {
            try urlResponse?.validateResponse()
        }catch {
        }
    }
    
    func testResponseCode500() throws {
        let urlResponse =  HTTPURLResponse(url: URL(string: "test")!, statusCode: 500, httpVersion:"1", headerFields: [:])
        do {
            try urlResponse?.validateResponse()
        }catch {
            XCTAssertEqual(error as! RequestError, RequestError.unexpectedStatusCode)
        }    }
    
    func testResponseCode401() throws {

        let urlResponse =  HTTPURLResponse(url: URL(string: "test")!, statusCode: 401, httpVersion:"1", headerFields: [:])
        do {
            try urlResponse?.validateResponse()
        }catch {
            XCTAssertEqual(error as! RequestError, RequestError.unauthorized)
        }    }
}
