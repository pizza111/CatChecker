//
//  ErrorView.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color(uiColor: .blue),
                Color(uiColor: .systemPink)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                Text("😿")
                    .font(.system(size: 70))
                if breedFetcher.errorFetchMessage != nil {
                    Text(breedFetcher.errorFetchMessage!)
                        .font(.title2)
                }
                ButtonTryAgainViewAPI(breedFetcher: breedFetcher)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
