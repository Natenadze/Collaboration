//
//  WeatherController.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//

import UIKit


final class WeatherController: UIViewController, WeatherControllerViewModelDelegate {
    // MARK: - Properties
    private let viewModel = WeatherControllerViewModel()
    
    // MARK: - UI Elements
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let latTextField: UITextField = {
        let latTextField = UITextField()
        return latTextField
    }()
    
    private let lonTextField: UITextField = {
        let lonTextField = UITextField()
        return lonTextField
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let cityTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let showWeatherButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let showCityWeatherButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        viewModel.delegate = self
    }
    
    // MARK: - Methods
    private func presentWeatherTapped() {
         guard let latitude = Double(latTextField.text ?? ""),
              let longitude = Double(lonTextField.text ?? "")
        else {
            return
        }
             viewModel.fetchWeather(lat: latitude, lon: longitude)
    }
    

    private func  presentCityWeatherTapped() {
        guard let city = cityTextField.text
        else {
            return
        }
        viewModel.fetchWeatherAccordingToCity(city: city)
    }
    
    private func updateWeatherLabel() {
        if let temperature = viewModel.weather?.list.first?.main.temp {
            self.weatherLabel.text = "Temperature: \(temperature)°C"
        } else {
            self.weatherLabel.text = "Weather data not available"
        }
    }
    
    func weatherFetched() {
        updateWeatherLabel()
    }
    
    func weatherFetchedAccordingToCity() {
        updateWeatherLabel()
    }
}

// MARK: - Style & Layout

private extension WeatherController {
    
    
    private func style() {
        view.backgroundColor = .white
        latTextField.borderStyle = .roundedRect
        latTextField.placeholder = "Text field 1"
        
        lonTextField.borderStyle = .roundedRect
        lonTextField.placeholder = "Text field 2"
        
        weatherLabel.text = "Weather"
        weatherLabel.textColor = .darkGray
        weatherLabel.font = UIFont.systemFont(ofSize: 14)
        
        cityTextField.borderStyle = .roundedRect
        cityTextField.placeholder = "Text field 3"
        
        showWeatherButton.setTitle("Show Weather", for: .normal)
        showWeatherButton.backgroundColor = .lightGray
        showWeatherButton.layer.cornerRadius = 23
        showWeatherButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presentWeatherTapped()
        }), for: .touchUpInside)
        
        showCityWeatherButton.setTitle("Show City Weather", for: .normal)
        showCityWeatherButton.backgroundColor = .lightGray
        showCityWeatherButton.layer.cornerRadius = 23
        showCityWeatherButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presentCityWeatherTapped()
        }), for: .touchUpInside)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
    }
    
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(latTextField)
        stackView.addArrangedSubview(lonTextField)
        stackView.addArrangedSubview(weatherLabel)
        stackView.addArrangedSubview(cityTextField)
        view.addSubview(showWeatherButton)
        view.addSubview(showCityWeatherButton)

        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        showWeatherButton.translatesAutoresizingMaskIntoConstraints = false 
        showCityWeatherButton.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            showWeatherButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            showWeatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showWeatherButton.heightAnchor.constraint(equalToConstant: 46),
            showWeatherButton.widthAnchor.constraint(equalToConstant: 200),
            
            showCityWeatherButton.topAnchor.constraint(equalTo: showWeatherButton.bottomAnchor, constant: 20),
            showCityWeatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showCityWeatherButton.heightAnchor.constraint(equalToConstant: 46),
            showCityWeatherButton.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        stackView.setCustomSpacing(100, after: showWeatherButton)
        stackView.setCustomSpacing(30, after: weatherLabel)
        
    }
}



//
// // MARK: - Preview
// #Preview {
// WeatherController()
// }

