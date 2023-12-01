//
//  SpecieModel.swift
//  CollaborationTeamOne
//
//  Created by Sesili Tsikaridze on 30.11.23.
//

import Foundation

struct SpecieResponse: Codable {
    let results: [Species]
    
}

// MARK: - Result
struct Species: Codable {
    let count: Int
    let taxon: Taxon
}

// MARK: - Taxon
struct Taxon: Codable {
    let name: String
    let defaultPhoto: DefaultPhoto
    let wikipediaURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case defaultPhoto = "default_photo"
        case wikipediaURL = "wikipedia_url"
    }
}

// MARK: - DefaultPhoto
struct DefaultPhoto: Codable {
    let attribution: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case attribution, url
    }
}
