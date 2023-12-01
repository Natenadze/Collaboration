//
//  PopulationController.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//

import UIKit


final class PopulationController: UIViewController {
    
    // MARK: - Properties
    private let viewModel = PopulationControllerViewModel()
    private let todayView = DateAndPopulationView()
    private let tomorrowView = DateAndPopulationView()
    
    // MARK: - UI Elements
    private let mainStack = UIStackView()
    
    private let textField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .systemBackground
        textfield.layer.cornerRadius = 8
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .words
        textfield.placeholder = "Enter city name..."
        return textfield
    }()
    
    private let showPopulationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show population", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "Today:"
        label.textColor = .systemBlue
        return label
    }()
    
    private let tomorrowLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "Tomorrow:"
        label.textColor = .systemBlue
        return label
    }()
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        style()
        layout()
    }
    
    // MARK: - Methods
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
    private func showPopulationButtonPressed() {
        guard let cityName = textField.text, cityName.count > 2 else {
            self.showAlert(title: "Nothing to show", message: "Please enter a country name with more than 2 characters")
            return
        }
        viewModel.handleShowPopulationButtonPressed(with: cityName)
    }
    
}

// MARK: - Style & Layout

private extension PopulationController {
    
    func style() {
        view.backgroundColor = .secondarySystemBackground
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.spacing = 20
        
        showPopulationButton.addAction(UIAction(handler: { [weak self] _ in
            self?.showPopulationButtonPressed()
        }), for: .touchUpInside)
    }
    
    func layout() {
        mainStack.addArrangedSubview(textField)
        mainStack.addArrangedSubview(showPopulationButton)
        mainStack.addArrangedSubview(todayLabel)
        mainStack.addArrangedSubview(todayView)
        mainStack.addArrangedSubview(tomorrowLabel)
        mainStack.addArrangedSubview(tomorrowView)
        
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            showPopulationButton.heightAnchor.constraint(equalToConstant: 44),
            showPopulationButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: showPopulationButton.trailingAnchor, multiplier: 4),
            
            mainStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainStack.trailingAnchor, multiplier: 4),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
}

// MARK: - PopulationControllerViewModelDelegate

extension PopulationController: PopulationControllerViewModelDelegate {
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            AlertManager.showAlert(title: title, message: message, controller: self) {
                self.textField.text = ""
            }
        }
    }
    
    
    func populationFetched() {
        todayView.dateLabel.text = viewModel.getDateForToday()
        todayView.populationLabel.text = viewModel.getPopulationForToday()
        
        tomorrowView.dateLabel.text = viewModel.getDateForTomorrow()
        tomorrowView.populationLabel.text = viewModel.getPopulationForTomorrow()
    }
    
}


// MARK: - Preview
#Preview {
    PopulationController()
}


//TODO: - Move this class to proper folder
class AlertManager {
    
    static func showAlert(title: String, message: String, controller: UIViewController, completion: @escaping () -> Void) {
       
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                
                completion()
            }
            alertController.addAction(okAction)
            
            
            controller.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
}
