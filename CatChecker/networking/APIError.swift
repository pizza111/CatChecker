//
//  APIError.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case URLError(URLError?)
    case badResponse(statusCode: Int)
    case parsing(DecodingError?)
    
    var description: String {
        switch self {
        case .badURL:
            return "Oops! There was an error"
        case .URLError(_):
            return "Oops! There was an error"
        case .badResponse(_):
            return "Oops! There was an error"
        case .parsing(_):
            return "Oops! There was an error"
        }
    }
    var localizedCustomDescription: String {
        switch self {
        case .badURL:
            return "Invalid URL"
        case .URLError(let optional):
            return "Error: \(optional?.localizedDescription ?? "")"
        case .badResponse(let statusCode):
            return "Error response nr: \(statusCode)"
        case .parsing(let optional):
            return "Error parsing: \(optional?.localizedDescription ?? "")"
        }
    }
}
