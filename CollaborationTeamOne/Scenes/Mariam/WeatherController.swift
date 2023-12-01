//
//  WeatherController.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//

import UIKit


final class WeatherController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - UI Elements
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: - Methods
    
}


// MARK: - Style & Layout

private extension WeatherController {
    
    
    func style() {
        view.backgroundColor = .blue
        
    }
    
    func layout() {
        
        
        NSLayoutConstraint.activate([
            
            
        ])
        
    }
}

/*
 // MARK: - Preview
 #Preview {
 WeatherController()
 }
 */
