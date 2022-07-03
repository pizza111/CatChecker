//
//  APIService.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import Foundation

struct APIService: APIServiceProtocol {
    func fetchDataGeneric<T: Decodable>(type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = url else {
            completion(.failure(APIError.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(APIError.URLError(error as? URLError)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(type, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        .resume()
    }
    func fetchData(url: URL?, completion: @escaping (Result<[Element], APIError>) -> Void) {
        guard let url = url else {
            completion(.failure(APIError.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(APIError.URLError(error as? URLError)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(Empty.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        .resume()
    }
}
