//
//  AppRowCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

final class AppRowCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppRowCell"
    
    private let imageView = ASAppIconImageView(width: 64, height: 64)
    private let nameLabel = ASTitleLabel(text: "App Name", size: 16)
    private let companyLabel = ASTitleLabel(text: "Company Name", size: 13)
    private let getButton = ASGetButton(type: .system)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
//        backgroundColor = .systemOrange
        
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel])
        labelStackView.axis = .vertical
        
        let containerStackView = UIStackView(arrangedSubviews: [imageView, labelStackView, getButton])
        containerStackView.alignment = .center
        containerStackView.spacing = 10
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerStackView)
    
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
