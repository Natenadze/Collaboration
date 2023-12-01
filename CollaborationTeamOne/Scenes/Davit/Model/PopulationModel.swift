//
//  PopulationModel.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//

import Foundation


struct Population: Decodable {
    
    let totalPopulation: [TotalPopulation]
    
    enum CodingKeys: String, CodingKey {
        case totalPopulation = "total_population"
    }
    
}

// MARK: - TotalPopulation
struct TotalPopulation: Decodable {
    let date: String
    let population: Int
}


