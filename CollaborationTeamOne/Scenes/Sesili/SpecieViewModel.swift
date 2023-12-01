//
//  SpecieViewModel.swift
//  CollaborationTeamOne
//
//  Created by Sesili Tsikaridze on 30.11.23.
//

import NatenWorking
import UIKit

protocol SpecieViewModelDelegate: AnyObject {
    func reloadData(tableView: UITableView)
}

final class SpecieViewModel {
    
    weak var delegate: SpecieViewModelDelegate?
    private var cityID = [Int]()
    var species = [Species]()
    
    func fetchCity(cityName: String, tableView: UITableView) {
        
        let url = "https://api.inaturalist.org/v1/places/autocomplete?q=\(cityName)"
        
        Task {
            if let result: CityResponse = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    cityID.removeAll()
                    let cities = result.results
                    for city in cities {
                        cityID.append(city.id)
                    }
                    fetchSpecie(tableView: tableView)
                }
            } else {
                throw NetworkError.noData
            }
        }
    }
    
    func fetchSpecie(tableView: UITableView) {
        
        let url = "https://api.inaturalist.org/v1/observations/species_counts?place_id=\(cityID[1])"
        
        Task {
            if let result: SpecieResponse = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    species.removeAll()
                    species = result.results
                    delegate?.reloadData(tableView: tableView)
                }
            } else {
                throw NetworkError.noData
            }
        }
    }
}
