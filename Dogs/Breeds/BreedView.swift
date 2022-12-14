//
//  BreedView.swift
//  Dogs
//
//  Created by Charles on 11/11/2022.
//

import SwiftUI

struct BreedView: View {
    @StateObject var breedViewModel = BreedViewModel()
     
     @State var breeds: [Breed] = []
     var body: some View {
         
         NavigationStack(path: $breeds) {
             List {
                 ForEach(breedViewModel.breeds, id: \.self) { breed in
                     NavigationLink {
                         BreedDetailsView(breed: breed)
                     } label: {
                        BreedViewRow(breed: breed)
                     }
                 }
             }
             .navigationTitle("dog_breeds")
         }
         .onAppear {
             breedViewModel.getBreeds(endPoint: BreedEndPoint())
         }
     }
}

struct BreedView_Previews: PreviewProvider {
    static var previews: some View {
        BreedView()
    }
}
