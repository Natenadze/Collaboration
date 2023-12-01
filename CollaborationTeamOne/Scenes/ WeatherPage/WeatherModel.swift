//
//  WeatherModel.swift
//  CollaborationTeamOne
//
//  Created by Mariam Joglidze on 30.11.23.
//

import Foundation

struct WeatherData: Decodable {
    let list: [List]
    
    struct List: Decodable {
        let main: Main
        
        struct Main: Decodable {
            let temp: Double
        }
    }
}



