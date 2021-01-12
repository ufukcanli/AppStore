//
//  AppsItemCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit
import SDWebImage

final class AppsItemCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsItemCell"
    
    private let imageView = ASAppIconImageView(width: 64, height: 64)
    private let nameLabel = ASTitleLabel(text: "App Name", font: .boldSystemFont(ofSize: 16))
    private let companyLabel = ASTitleLabel(text: "Company Name", font: .systemFont(ofSize: 13))
    private let getButton = ASGetButton(type: .system)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateCell(withApp app: FeedResult) {
        nameLabel.text = app.name
        companyLabel.text = app.artistName
        imageView.sd_setImage(with: URL(string: app.artworkUrl100))
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
