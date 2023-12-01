//
//  CityModel.swift
//  CollaborationTeamOne
//
//  Created by Sesili Tsikaridze on 30.11.23.
//

import Foundation

struct CityResponse: Codable {
    let results: [City]
}

struct City: Codable {
    let id: Int
}

