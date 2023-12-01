//
//  PopulationControllerViewModel.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//

import Foundation
import NatenWorking

protocol PopulationControllerViewModelDelegate: AnyObject {
    func populationFetched()
    func showAlert(title: String, message: String)
}

final class PopulationControllerViewModel {
    
    // MARK: - Properties
    private var population = [TotalPopulation]()
    weak var delegate: PopulationControllerViewModelDelegate?
    
    
    // MARK: - Methods
    func handleShowPopulationButtonPressed(with countryName: String) {
        let url = "https://d6wn6bmjj722w.population.io/1.0/population/\(countryName)/today-and-tomorrow/"
        fetchPopulation(url)
    }
    
    func getDateForToday() -> String {
        population[0].date
    }
    
    func getPopulationForToday() -> String {
        let population = population[0].population
        return formatPopulationNumber(populationNumber: population)
    }
    
    func getDateForTomorrow() -> String {
        population[1].date
    }
    
    func getPopulationForTomorrow() -> String {
        let population = population[1].population
        return formatPopulationNumber(populationNumber: population)
    }
    
    //TODO: - Make separate file for formatter
    func formatPopulationNumber(populationNumber: Int) -> String {
        populationNumber.formatNumber()
    }
    
}

// MARK: - Networking extension

extension PopulationControllerViewModel {
    
    private func fetchPopulation(_ url: String) {
        Task {
            if let result: Population = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    population = result.totalPopulation
                    delegate?.populationFetched()
                }
            } else {
                delegate?.showAlert(title: "Wrong country name", message: "Please enter the country name correctly")
            }
        }
    }
}



extension Int {
    
    func formatNumber() -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: self)) {
            return formattedNumber
        }
        
        return "0"
    }
}

