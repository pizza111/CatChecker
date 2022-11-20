//
//  APIMockService.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 20/11/2022.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    var result: Result<[Element], APIError>
    
    func fetchData(url: URL?, completion: @escaping (Result<[Element], APIError>) -> Void) {
        completion(result)
    }
}
