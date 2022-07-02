//
//  ButtonTryAgainViewAPI.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import SwiftUI

struct ButtonTryAgainViewAPI: View {
    @ObservedObject var breedFetcher: BreedFetcher
    
    var body: some View {
        Button("Try again") {
            breedFetcher.loadData()
        }
        .font(.title2)
        .padding()
        .background(
            LinearGradient(colors: [
                Color(uiColor: .systemPink),
                Color(uiColor: .gray)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}


struct ButtonTryAgainViewAPI_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTryAgainViewAPI(breedFetcher: BreedFetcher())
    }
}
