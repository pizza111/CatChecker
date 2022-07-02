//
//  BreedFetcher.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import Foundation

class BreedFetcher: ObservableObject {
    @Published var allBreeds = Empty()
    private let urlString = "https://api.thecatapi.com/v1/breeds"
    
    init() {
        fetchData()
    }
    func fetchData() {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { [unowned self] (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                print("Response error number: \(response.statusCode)")
            } else if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(Empty.self, from: data)
                    DispatchQueue.main.async {
                        self.allBreeds = decoded
                    }
                } catch {
                    print(error)
                }
            }
        }
        .resume()
    }
}
