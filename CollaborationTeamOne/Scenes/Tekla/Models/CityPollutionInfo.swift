//
//  AirQualityResponse.swift
//  CollaborationTeamOne
//
//  Created by Tekla Matcharashvili on 29.11.23.
//

import Foundation

struct CityPollutionInfo: Decodable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let city: String
    let current: Current
}

// MARK: - Current
struct Current: Decodable {
    let pollution: Pollution
}

// MARK: - Pollution
struct Pollution: Decodable {
    let aqius: Int
    let mainus: String
    let aqicn: Int
    let maincn: String
}
