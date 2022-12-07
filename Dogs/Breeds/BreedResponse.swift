//
//  BreedResponse.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import Foundation

struct BreedResponse: Decodable {
    let message: [String: [String]]
}

extension BreedResponse {
    func breedsMapper() -> [Breed] {
       return self.message.keys.map {
            let values = self.message[$0]
            let subTitle = values?.joined(separator: ",  ")
            return Breed(name: $0.capitalized, subTitle: subTitle ?? "")
           }.sorted { $0.name < $1.name}
    }
}
