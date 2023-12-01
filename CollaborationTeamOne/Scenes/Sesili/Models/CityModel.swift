//
//  CityModel.swift
//  CollaborationTeamOne
//
//  Created by Sesili Tsikaridze on 30.11.23.
//

import Foundation

struct CityResponse: Decodable {
    let results: [City]
}

struct City: Decodable {
    let id: Int
}

