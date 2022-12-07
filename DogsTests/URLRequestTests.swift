//
//  URLRequestTests.swift
//  DogsTests
//
//  Created by Charles on 07/12/22.
//

import XCTest
@testable import Dogs

final class URLRequestTests: XCTestCase {

    func test_urlrequest_when_url_is_correct() {
        let endPoint = MockEndPoint(path:"/test", method: .get)
        let request =  URLRequest.getRequest(endpoint: endPoint)
        
        XCTAssertNotNil(request)
        
        XCTAssertEqual(request?.url?.absoluteString, "https://dog.ceo/test")
    }
    
    func test_urlrequest_when_url_is_in_correct() {
        let endPoint = MockEndPoint(path:"", method: .get)
        let request =  URLRequest.getRequest(endpoint: endPoint)
        
        XCTAssertNil(request)
    
    }
    
    func test_urlrequest_when_url_path_is_invalid() {
        let endPoint = MockEndPoint(path:"test", method: .get)
        let request =  URLRequest.getRequest(endpoint: endPoint)
        
        XCTAssertNil(request)
    
    }
}

struct MockEndPoint: Endpoint {
    var path: String
    
    var method: Dogs.RequestMethod
    
    var header: [String : String]?
    
    var body: [String : String]?

}
