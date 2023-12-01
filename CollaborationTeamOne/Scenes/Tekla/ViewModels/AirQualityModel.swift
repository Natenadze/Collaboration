//
//  AirQualityModel.swift
//  CollaborationTeamOne
//
//  Created by Tekla Matcharashvili on 29.11.23.
//

import Foundation
import NatenWorking

protocol AirControllerViewModelDelegate:  AnyObject {
    func airPollutionFetched(air: DataClass)
}

final class AirQualityViewModel {
    // MARK: - Properties
    var airQuality: DataClass?
    weak var delegate: AirControllerViewModelDelegate?
    
    // MARK: - Methods
    func fetchData(for city: String) {
        let apiKey = "2076fd77-aede-4528-a78f-8a71096438c0"
        let apiUrl = "https://api.airvisual.com/v2/city?city=\(city)&state=New%20York&country=USA&key=\(apiKey)"
        
        Task {
            if let result: CityPollutionInfo? = try? await NetworkManager().performURLRequest(apiUrl) {
                await MainActor.run {
                    airQuality = result?.data
                    if let airQuality{
                        delegate?.airPollutionFetched(air: airQuality)
                    }
                    
                }
            } else {
                print("error fetching weather data")
            }
        }
    }
}
