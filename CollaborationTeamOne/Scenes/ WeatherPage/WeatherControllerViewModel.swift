//
//  WeatherControllerViewModel.swift
//  CollaborationTeamOne
//
//  Created by Mariam Joglidze on 30.11.23.
//

import Foundation
import NatenWorking

protocol WeatherControllerViewModelDelegate:  AnyObject {
    func weatherFetched()
    func weatherFetchedAccordingToCity()
}

final class WeatherControllerViewModel {
    
    // MARK: - Properties
    var weather: WeatherData?
    weak var delegate: WeatherControllerViewModelDelegate?
    
    // MARK: - Methods
    func fetchWeather(lat: Double, lon: Double) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=4d7491f21758642ccd422738d8e3e01c"
        
        Task {
            do {
                let result: WeatherData? = try await NetworkManager().performURLRequest(urlString)
                
                if let weatherData = result {
                    await MainActor.run {
                        self.weather = weatherData
                        self.delegate?.weatherFetched()
                    }
                }
            } catch {
                print("Error fetching weather data: \(error)")
            }
        }
    }
    
    
    func fetchWeatherAccordingToCity(city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=4d7491f21758642ccd422738d8e3e01c"
        
        Task {
            do {
                let result: WeatherData? = try await NetworkManager().performURLRequest(urlString)
                
                if let weatherData = result {
                    await MainActor.run {
                        self.weather = weatherData
                        self.delegate?.weatherFetchedAccordingToCity()
                    }
                }
            } catch {
                print("Error fetching weather data: \(error)")
            }
        }
    }
}


