//
//  BreedViewMoreEndPoint.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import Foundation

struct BreedViewMoreEndPoint: Endpoint {
    var header: [String: String]?
    
    var body: [String: String]?
    
    var breedName: String
    
    var path: String {
        return "/api/breed/\(breedName.lowercased())/images"
    }
    var method: RequestMethod {
        return .get
    }
}
