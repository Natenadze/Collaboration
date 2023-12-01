//
//  SolarResourceControllerViewModel.swift
//  CollaborationTeamOne
//
//  Created by salome on 01.12.23.
//

import Foundation

import Foundation
import NatenWorking


final class SolarResourceControllerViewModel {
    
    private (set) var result = ""


    func fetchData(cityName: String, completion: @escaping (Result<AddressResponse, Error>) -> Void) {
        let apiKey = "zdWHDb3omhcnanPWduVYSiZjxJn0HUtYtgctMwHa"
        let urlString =
        
    "https://developer.nrel.gov/api/solar/solar_resource/v1.json?api_key=\(apiKey)&address=\(cityName)"

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let solarData = try decoder.decode(AddressResponse.self, from: data)
                        self?.updateResult(with: solarData.outputs)
                        completion(.success(solarData))
                    } catch {
                        completion(.failure(error))
                    }
                } else if let error = error {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
    private func updateResult (with  solarInfo: Info ) {
        let averageDNIText = "Average DNI: \(solarInfo.avgDni.annual)"
        let averageGHIText = "Average GHI: \(solarInfo.avgGhi.annual)"
        let averageLatTiltText = "Average Latitude Tilt: \(solarInfo.avgLatTilt.annual)"
        
        result = "\(averageDNIText)\n\(averageGHIText)\n\(averageLatTiltText)"
    }
}

