//
//  AirQualityController.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//

import UIKit

class AirQualityController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    let cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter City"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let fetchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Fetch Data", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let airConditionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.backgroundColor = .lightGray.withAlphaComponent(0.2)
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var viewModel = AirQualityViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
        viewModel.delegate = self
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(cityTextField)
        view.addSubview(fetchButton)
        view.addSubview(resultLabel)
        view.addSubview(airConditionLabel)
        airConditionLabel.text = "Air Quality Guidelines:\nGood: 0-50, Moderate: 51-100, Unhealthy for Sensitive Groups: 101-150, Unhealthy: 151-200, Very Unhealthy: 201-300, Hazardous: 301 and above"
        NSLayoutConstraint.activate([
            
            cityTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            fetchButton.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 20),
            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fetchButton.widthAnchor.constraint(equalToConstant: 200),
            fetchButton.heightAnchor.constraint(equalToConstant: 40),
            
            resultLabel.topAnchor.constraint(equalTo: fetchButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            airConditionLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            airConditionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            airConditionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        fetchButton.addTarget(self, action: #selector(fetchButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Button Action
    
    @objc func fetchButtonTapped() {
        guard let city = cityTextField.text, !city.isEmpty else {
            print("Please enter a city name")
            return
        }
        
        viewModel.fetchData(for: city)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
// MARK: - UI Update
extension AirQualityController: AirControllerViewModelDelegate {
    func airPollutionFetched(air: DataClass) {
        updateUI(with: air)
    }
    
    private func updateUI(with air: DataClass) {
        let pollution = air.current.pollution
        
        resultLabel.text = """
            City: \(air.city)
            AQI (US): \(pollution.aqius)
            Main Pollutant (US): \(pollution.mainus)
            AQI (China): \(pollution.aqicn)
            Main Pollutant (China): \(pollution.maincn)
        """
    }
}
