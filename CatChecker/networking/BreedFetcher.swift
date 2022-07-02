//
//  BreedFetcher.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import Foundation

class BreedFetcher: ObservableObject {
    @Published var allBreeds = Empty()
    @Published var isActive = true
    @Published var errorFetchMessage: String?
    private let urlString = "https://api.thecatapi.com/v1/breeds"
    
    init() {
        fetchData()
    }
    func fetchData() {
        guard let url = URL(string: urlString) else {
            errorFetchMessage = "There was some error"
            return
        }
        URLSession.shared.dataTask(with: url) { [unowned self] (data, response, error) in
            DispatchQueue.main.async {
                self.isActive = false
                
                if error != nil {
                    self.errorFetchMessage = "There was some error"
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    self.errorFetchMessage = "There was some error"
                } else if let data = data {
                    do {
                        let decoded = try JSONDecoder().decode(Empty.self, from: data)
                        DispatchQueue.main.async {
                            self.allBreeds = decoded
                        }
                    } catch {
                        self.errorFetchMessage = "There was some error"
                    }
                }
            }
        }
        .resume()
    }
}
