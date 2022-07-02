//
//  SuccessView.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import SwiftUI

struct SuccessView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    @State private var catSearch = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterCats) { item in
                    NavigationLink {
                        DetailsView(cat: item)
                    } label: {
                        LabelView(cat: item)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Find your perfect cat")
            .searchable(text: $catSearch)
        }
    }
    var filterCats: [Element] {
        if catSearch.isEmpty {
            return breedFetcher.allBreeds
        } else {
            return breedFetcher.allBreeds.filter { $0.name!.localizedCaseInsensitiveContains(catSearch) }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(breedFetcher: BreedFetcher())
    }
}
