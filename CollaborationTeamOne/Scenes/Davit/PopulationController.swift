//
//  PopulationController.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//


import UIKit


final class PopulationController: UIViewController {
    
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

private extension PopulationController {
    
    
    func style() {
        view.backgroundColor = .orange
        
    }
    
    func layout() {
        
        
        NSLayoutConstraint.activate([
            
            
        ])
        
    }
}

/*
 // MARK: - Preview
 #Preview {
 MusicDetailsVC()
 }
 */
