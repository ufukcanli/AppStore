//
//  AppsItemCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit
import SDWebImage

class AppsItemCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsItemCell"
    
    let imageView = ASAppIconImageView(width: 60, height: 60)
    let nameLabel = ASTitleLabel(text: "App Name", font: .boldSystemFont(ofSize: 16))
    let companyLabel = ASTitleLabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = ASGetButton(backgroundColor: .customGray, title: "GET", color: .customBlue)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(withApp app: FeedResult) {
        nameLabel.text = app.name
        companyLabel.text = app.artistName
        imageView.sd_setImage(with: URL(string: app.artworkUrl100))
    }
    
    func configureCell() {
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
