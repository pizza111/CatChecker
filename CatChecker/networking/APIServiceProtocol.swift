//
//  APIServiceProtocol.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 03/07/2022.
//

import Foundation

protocol APIServiceProtocol {
    func fetchData(url: URL?, completion: @escaping (Result<[Element], APIError>) -> Void)
}
