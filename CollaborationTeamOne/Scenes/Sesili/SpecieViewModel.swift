//
//  SpecieViewModel.swift
//  CollaborationTeamOne
//
//  Created by Sesili Tsikaridze on 30.11.23.
//

import Foundation
import NatenWorking

protocol SpecieViewModelDelegate: AnyObject {
    func cityFetched(_ city: City)
}

final class SpecieViewModel {
    
    weak var delegate: SpecieViewModelDelegate?
    var cityID = [Int]()
        
    
    func fetchCity(cityName: String) {
        
        let url = "https://api.inaturalist.org/v1/places/autocomplete?q=\(cityName)"
        
        
        Task {
            if let result: CityResponse = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    let cities = result.results
                    for city in cities {
                        cityID.append(city.id)
                    }
                }
            } else {
                throw NetworkError.noData
            }
        }
    }

    
}
