//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import UIKit

final class SearchResultCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SearchResultCell"
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let categoryLabel = UILabel()
    private let ratingsLabel = UILabel()
    private let getButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        backgroundColor = .systemGreen
        
        imageView.backgroundColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "APP NAME"
        categoryLabel.text = "Photos & Video"
        ratingsLabel.text = "9.26M"
        
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelStackView.axis = .vertical
        
        getButton.backgroundColor = .systemGray
        getButton.setTitle("GET", for: .normal)
        getButton.setTitleColor(.systemBlue, for: .normal)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        getButton.translatesAutoresizingMaskIntoConstraints = false
        
        let containerStackView = UIStackView(arrangedSubviews: [imageView, labelStackView, getButton])
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.alignment = .center
        containerStackView.spacing = 12
    
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 64),
            imageView.heightAnchor.constraint(equalToConstant: 64),
            
            getButton.widthAnchor.constraint(equalToConstant: 80),
            
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
