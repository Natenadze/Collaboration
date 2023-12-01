//
//  SolarResourceController.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//

import UIKit

final class SolarResourceController: UIViewController, UITextFieldDelegate {
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Address"
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        return textField
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.backgroundColor = .lightGray.withAlphaComponent(0.2)
        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addressTextField,  submitButton, resultLabel])
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    var viewModel = SolarResourceControllerViewModel()
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        addSubviews()
        setupConstraints()
        setupSubmitButtonAction()
        setupAddressTextField()
        
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .white
    }
    private func addSubviews() {
        view.addSubview(mainStackView)
        
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        addressTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    private func setupSubmitButtonAction() {
        submitButton.addAction(
            UIAction(
                title: "",
                handler: { [weak self] action in
                    self?.submitButtonTapped()
                }
            ),for: .touchUpInside
        )}
    private func submitButtonTapped() {
        guard let address = addressTextField.text, !address.isEmpty
                
        else {
            showAlert(with: "Enter Address cannot be empty")
            return
            
        }
        
        self.viewModel.fetchData(cityName: address) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let solarData):
                print("Data fetched successfully")
                self.updateUI(with: solarData.outputs)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
    
    private func updateUI(with solarData: Info) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.resultLabel.text = self.viewModel.result
        }
    }
    
    private func showAlert(with title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    private func setupAddressTextField() {
        addressTextField.delegate = self
    }
    
    private func textFieldReturned(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

