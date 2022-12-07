//
//  BreedDetailsViewModel.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import Foundation

@MainActor
class BreedDetailsViewModel: ObservableObject {
    
    let httpClient: HTTPClient
    
    @Published var breedDetail: [BreedDetail]  = []
    
    init(httpClient: HTTPClient = NetworkClient()) {
        self.httpClient = httpClient
    }
    
    func getBreedDetails(endPoint: BreedDetailsEndPoint) {
        Task {
            let result =   await httpClient.sendRequest(endpoint: endPoint, responseModel: BreedDetailsResopnse.self)
            
            switch result {
            case .success(let breedDetailsResponse):
                breedDetail =    breedDetailsResponse.breedDetailsMapper()
            case .failure(_):
                breedDetail = []
            }
        }
    }
    
    func getMoreBreedsImages(endPoint: BreedViewMoreEndPoint) {
        Task {
            let result =   await httpClient.sendRequest(endpoint: endPoint, responseModel: BreedDetailsResopnse.self)
            
            switch result {
            case .success(let breedDetailsResponse):
                breedDetail =    breedDetailsResponse.breedDetailsMapper()
            case .failure(let error):
                print(error)
            }
        }
    }
}
