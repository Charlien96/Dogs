//
//  BreedDetailsResponse.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import Foundation

struct BreedDetailsResopnse: Decodable {
    let message: [String]
}

extension BreedDetailsResopnse {
    func breedDetailsMapper() ->  [BreedDetail] {
        return self.message.map {
             BreedDetail(imageName: $0)
           }
    }
}
