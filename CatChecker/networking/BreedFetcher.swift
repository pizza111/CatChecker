//
//  BreedFetcher.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import Foundation

class BreedFetcher: ObservableObject {
    @Published var allBreeds = Empty()
    @Published var isLoading = true
    @Published var errorFetchMessage: String?
    private let urlString = "https://api.thecatapi.com/v1/breeds"
    private let apiService = APIService()
    
    init() {
        loadData()
    }
    func loadData() {
        apiService.fetchData(url: URL(string: urlString)) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .failure(let error):
                    self.errorFetchMessage = error.description
                case .success(let result):
                    self.allBreeds = result
                }
            }
        }
    }
}
