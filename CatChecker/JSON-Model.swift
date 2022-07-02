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
    var hairless: Bool
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
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        purpleDescription = try values.decode(String.self, forKey: .purpleDescription)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        let hair = try values.decode(Int.self, forKey: .hairless)
        hairless = hair == 1
        image = try values.decodeIfPresent(ImageOne.self, forKey: .image)
    }
    init(name: String, id: String, temperament: String, description: String, energyLevel: Int, hairless: Bool, image: ImageOne) {
        self.id = id
        self.name = name
        self.temperament = temperament
        self.purpleDescription = description
        self.energyLevel = energyLevel
        self.hairless = hairless
        self.image = image
    }
    static let exampleOfBreed = Element(name: "Abyssinian", id: "abys", temperament: "Active, Energetic, Independent, Intelligent, Gentle", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", energyLevel: 5, hairless: false, image: ImageOne(id: "0XYvRd7oD", width: 1204, height: 1445, url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"))
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

