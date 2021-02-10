//
//  AppsDetailCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 10.02.2021.
//

import UIKit

class AppsDetailCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsDetailCell"
    
    let appIconImageView = ASAppIconImageView(width: 140, height: 140)
    let appNameLabel = ASTitleLabel(text: "App Name", font: .boldSystemFont(ofSize: 23))
    let appPriceButton = ASGetButton(backgroundColor: .customBlue, title: "$4.99")
    let whatsNewLabel = ASTitleLabel(text: "What's New", font: .boldSystemFont(ofSize: 18))
    let releaseNotes = ASBodyLabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        let padding: CGFloat = 20
        
        appIconImageView.backgroundColor = .systemRed
        releaseNotes.text = "Release Notes"
        
        let buttonStackView = UIStackView(arrangedSubviews: [appPriceButton, UIView()])
        
        let labelAndButtonStackView = UIStackView(arrangedSubviews: [appNameLabel, buttonStackView])
        labelAndButtonStackView.axis = .vertical
        
        let appInfoStackView = UIStackView(arrangedSubviews: [appIconImageView, labelAndButtonStackView])
        appInfoStackView.spacing = 20
        
        let containerStackView = UIStackView(arrangedSubviews: [appInfoStackView, whatsNewLabel, releaseNotes])
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding)
        ])
    }
}
