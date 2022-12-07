//
//  BreedViewModel.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import Foundation

@MainActor
class BreedViewModel: ObservableObject {
    
    let httpClient: HTTPClient
    
    @Published var breeds: [Breed]  = []
    
    init(httpClient: HTTPClient = NetworkClient()) {
        self.httpClient = httpClient
    }
    
    func getBreeds(endPoint: BreedEndPoint) {
        Task {
            let result =   await httpClient.sendRequest(endpoint: endPoint, responseModel: BreedResponse.self)
            switch result {
            case .success(let breedResponse):
                self.breeds =    breedResponse.breedsMapper()
            case .failure:
                self.breeds = []
            }
        }
    }
}
