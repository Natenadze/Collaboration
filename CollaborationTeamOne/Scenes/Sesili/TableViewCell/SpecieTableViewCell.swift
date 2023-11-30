//
//  SpecieTableViewCell.swift
//  CollaborationTeamOne
//
//  Created by Sesili Tsikaridze on 30.11.23.
//

import UIKit

class SpecieTableViewCell: UITableViewCell {
    
    private let specieImage = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return image
    }()
    
    private let nameLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textColor = .darkGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let authorLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.textColor = .lightGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let labelStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
//        stackView.distribution = .equalCentering
//        stackView.alignment = .leading
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        sampleCellInfo()
        addViews()
        setupConstraints()
//        prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        specieImage.image = nil
        nameLabel.text = nil
        authorLabel.text = nil
    }
    
    private func sampleCellInfo() {
        specieImage.image = .sample
        nameLabel.text = "Mia the fluffy predator"
        authorLabel.text = "Sesili Tsikaridze"
    }
    
    private func addViews() {
        contentView.addSubview(mainStackView)
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(authorLabel)
        mainStackView.addArrangedSubview(specieImage)
        mainStackView.addArrangedSubview(labelStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }

}
