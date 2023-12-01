//
//  DateAndPopulationView.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//


import UIKit

final class DateAndPopulationView: UIView {
    
    // MARK: - Properties
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "00-00-00"
        return label
    }()
    
    var populationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "0"
        return label
    }()
    
    // MARK: - UI Elements
    
    private let mainStack = UIStackView()
    private let dateHorizontalStack = UIStackView()
    private let populationHorizontalStack = UIStackView()
    
    private let date: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "date:"
        return label
    }()
    
    private let population: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "population:"
        return label
    }()
    
    
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Style & Layout

private extension DateAndPopulationView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.spacing = 8
        mainStack.alignment = .leading
        
        dateHorizontalStack.spacing = 16
        
        populationHorizontalStack.spacing = 16
    }
    
    func layout() {
        mainStack.addArrangedSubview(dateHorizontalStack)
        mainStack.addArrangedSubview(populationHorizontalStack)
        
        dateHorizontalStack.addArrangedSubview(date)
        dateHorizontalStack.addArrangedSubview(dateLabel)
        
        populationHorizontalStack.addArrangedSubview(population)
        populationHorizontalStack.addArrangedSubview(populationLabel)
        
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            mainStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: mainStack.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: mainStack.bottomAnchor, multiplier: 1),
        ])
        
    }
}


// MARK: - Preview
//#Preview {
//    DateAndPopulationView()
//}

