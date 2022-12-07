//
//  JsonParserTests.swift
//  DogsTests
//
//  Created by Charles on 07/12/22.
//

import XCTest
@testable import Dogs

final class JsonParserTests: XCTestCase {

    func test_json_parser_when_valid_data() {
        
        if let url = Bundle(for: JsonParserTests.self).url(forResource:"breed_success", withExtension:
                                                                ".json") {
            
            
            let data = try! Data(contentsOf: url)
            
            let parser = MockParser()
            let decodededResponse = try! parser.decode(data: data, responseModel: BreedResponse.self)
            
            XCTAssertEqual(decodededResponse.message.count, 98)
            
        }
       
    }
    
    func test_json_parser_when_invalid_data() {
        if let url = Bundle(for: JsonParserTests.self).url(forResource:"breed_success", withExtension:
                                                                ".json") {
            
            
            let data = try! Data(contentsOf: url)
            
            let parser = MockParser()
            
            do {
                let _ = try parser.decode(data: data, responseModel: BreedDetailsResopnse.self)
            }catch {
                XCTAssertEqual(error as! RequestError, RequestError.decode)

            }
        }
    }
   
}

struct MockParser: JsonParser {}
