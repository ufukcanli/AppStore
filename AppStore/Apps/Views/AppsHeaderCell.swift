//
//  AppsHeaderCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 10.01.2021.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsHeaderCell"
    
    let companyLabel = ASTitleLabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = ASTitleLabel(text: "Keeping up with friends faster than ever", font: .systemFont(ofSize: 26))
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        backgroundColor = .systemBackground
        
        companyLabel.textColor = .systemBlue
        
        imageView.backgroundColor = .systemRed
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        let stackView = UIStackView(arrangedSubviews: [companyLabel, titleLabel, imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.setCustomSpacing(15, after: titleLabel)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
