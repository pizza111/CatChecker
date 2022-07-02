//
//  JSON-Model.swift
//  CatChecker
//
//  Created by Piotr Woźniak on 02/07/2022.
//

import Foundation

// MARK: - Element
struct Element: Codable, Identifiable {
    var weight: Weight?
    var id, name: String?
    var cfaURL: String?
    var vetstreetURL: String?
    var vcahospitalsURL: String?
    var temperament, origin, countryCodes, countryCode: String?
    var purpleDescription, lifeSpan: String?
    var indoor, lap: Int?
    var altNames: String?
    var adaptability, affectionLevel, childFriendly, dogFriendly: Int?
    var energyLevel, grooming, healthIssues, intelligence: Int?
    var sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int?
    var experimental, natural, rare: Int?
    var hairless: Int
    var rex, suppressedTail, shortLegs: Int?
    var wikipediaURL: String?
    var hypoallergenic: Int?
    var referenceImageID: String?
    var image: ImageOne?
    var catFriendly, bidability: Int?

    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case cfaURL = "cfa_url"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
        case temperament, origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case purpleDescription = "description"
        case lifeSpan = "life_span"
        case indoor, lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, experimental, hairless, natural, rare, rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
        case referenceImageID = "reference_image_id"
        case image
        case catFriendly = "cat_friendly"
        case bidability
    }
}

// MARK: - Image
struct ImageOne: Codable {
    var id: String?
    var width, height: Int?
    var url: String?
}

// MARK: - Weight
struct Weight: Codable {
    var imperial, metric: String
}

typealias Empty = [Element]

