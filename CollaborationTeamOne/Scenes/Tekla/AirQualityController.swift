//
//  AirQualityController.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//

import UIKit

final class AirQualityController: UIViewController {
    
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

private extension AirQualityController {
    
    
    func style() {
        view.backgroundColor = .secondarySystemBackground
        
    }
    
    func layout() {
        
        
        NSLayoutConstraint.activate([
            
            
        ])
        
    }
}


  // MARK: - Preview
 #Preview {
 AirQualityController()
 }
 
