//
//  BreedEndPointTests.swift
//  DogsTests
//
//  Created by Charles on 07/12/22.
//

import XCTest
@testable import Dogs

final class EndPointsTests: XCTestCase {
   
    func testBreedEndPoint() {
        let breedEndPoint  = BreedEndPoint()
        XCTAssertEqual(breedEndPoint.path, "/api/breeds/list/all")
        XCTAssertEqual(breedEndPoint.method, RequestMethod.get)
    }
    
    func testBreedDetailsEndPoint() {
        let breedDetailsEndPoint  = BreedDetailsEndPoint(breedName:"Test")
        XCTAssertEqual(breedDetailsEndPoint.path, "/api/breed/test/images/random/3")
        
        XCTAssertEqual(breedDetailsEndPoint.method, RequestMethod.get)

    }
    
    func testBreedViewMoreEndPoint() {
        let breedViewMoreEndPoint  = BreedViewMoreEndPoint(breedName:"Test")
        XCTAssertEqual(breedViewMoreEndPoint.path, "/api/breed/test/images")
        
        XCTAssertEqual(breedViewMoreEndPoint.method, RequestMethod.get)

    }
}
