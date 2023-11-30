//
//  CityModel.swift
//  CollaborationTeamOne
//
//  Created by Sesili Tsikaridze on 30.11.23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let city = try? JSONDecoder().decode(City.self, from: jsonData)

import Foundation

struct CityResponse: Codable {
    let results: [City]
}
 
struct City: Codable {
    let id: Int
}

