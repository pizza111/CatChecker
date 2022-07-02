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
        Group {
            if breedFetcher.isActive {
                LoadingView()
            } else if breedFetcher.errorFetchMessage != nil {
                ErrorView(breedFetcher: breedFetcher)
            } else {
                SuccessView(breedFetcher: breedFetcher)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
