//
//  ContentView.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breedFetcher = BreedFetcher()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(breedFetcher.allBreeds) { breed in
                    if breed.image?.url != nil {
                        AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaleEffect()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                            } else if phase.error != nil {
                                Color.red
                                    .frame(width: 100, height: 100)
                            } else {
                                ProgressView()
                            }
                        }
                    } else {
                        Color.gray
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
