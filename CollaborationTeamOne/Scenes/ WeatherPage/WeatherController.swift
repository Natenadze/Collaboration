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
    let latTextField: UITextField = {
        let latTextField = UITextField()
        return latTextField
    }()
    
    let lonTextField: UITextField = {
        let lonTextField = UITextField()
        return lonTextField
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
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
        view.backgroundColor = .white
        latTextField.borderStyle = .roundedRect
        latTextField.placeholder = "Text field 1"
        
        lonTextField.borderStyle = .roundedRect
        lonTextField.placeholder = "Text field 2"
        
        stackView.addArrangedSubview(latTextField)
        stackView.addArrangedSubview(lonTextField)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        
    }
    
    func layout() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 100)

        ])
        
    }
}



// // MARK: - Preview
// #Preview {
// WeatherController()
// }

