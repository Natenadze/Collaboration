//
//  SolarResourceModel.swift
//  CollaborationTeamOne
//
//  Created by salome on 01.12.23.
//

import Foundation

struct AddressResponse: Decodable {
    let outputs: Info
}
struct Info: Decodable {
    let avgDni, avgGhi, avgLatTilt: Solar
 
    enum CodingKeys: String, CodingKey {
        case avgDni = "avg_dni"
        case avgGhi = "avg_ghi"
        case avgLatTilt = "avg_lat_tilt"
    }
}
 

struct Solar: Decodable {
    let annual: Double
}
