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
    let appPriceButton = ASGetButton(backgroundColor: .customBlue, title: "$4.99", color: .white)
    let whatsNewLabel = ASTitleLabel(text: "What's New", font: .boldSystemFont(ofSize: 18))
    let releaseNotesLabel = ASBodyLabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(app: SearchResult) {
        appNameLabel.text = app.trackName
        releaseNotesLabel.text = app.releaseNotes
        appIconImageView.sd_setImage(with: URL(string: app.artworkUrl100)!)
        appPriceButton.setTitle(app.formattedPrice, for: .normal)
    }
    
    func configureCell() {
        let padding: CGFloat = 20
        
        appIconImageView.backgroundColor = .systemRed
        releaseNotesLabel.text = "Release Notes"
        
        let buttonStackView = UIStackView(arrangedSubviews: [appPriceButton, UIView()])
        
        let labelAndButtonStackView = UIStackView(arrangedSubviews: [appNameLabel, buttonStackView])
        labelAndButtonStackView.axis = .vertical
        labelAndButtonStackView.spacing = 10
        
        let appInfoStackView = UIStackView(arrangedSubviews: [appIconImageView, labelAndButtonStackView])
        appInfoStackView.alignment = .top
        appInfoStackView.spacing = 20
        
        let containerStackView = UIStackView(arrangedSubviews: [appInfoStackView, whatsNewLabel, releaseNotesLabel])
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.setCustomSpacing(20, after: appInfoStackView)
        containerStackView.setCustomSpacing(5, after: whatsNewLabel)
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
