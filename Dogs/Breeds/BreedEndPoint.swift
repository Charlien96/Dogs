//
//  BreedEndPoint.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import Foundation

struct BreedEndPoint: Endpoint {
    var header: [String: String]?
    
    var body: [String: String]?
    
    var path: String {
        return "/api/breeds/list/all"
    }
    
    var method: RequestMethod {
        return .get
    }

}
