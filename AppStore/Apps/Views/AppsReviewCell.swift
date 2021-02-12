//
//  AppsReviewCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 12.02.2021.
//

import UIKit

class AppsReviewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsReviewCell"
    
    let titleLabel = ASTitleLabel(text: "Title", font: .boldSystemFont(ofSize: 18))
    let authorLabel = ASTitleLabel(text: "Author", font: .systemFont(ofSize: 16))
    let starsLabel = ASTitleLabel(text: "Stars", font: .systemFont(ofSize: 14))
    let starsStackView = UIStackView()
    let bodyLabel = ASBodyLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(entry: Entry) {
        titleLabel.text = entry.title.label
        authorLabel.text = entry.author.name.label
        bodyLabel.text = entry.content.label
        
        for (index, star) in starsStackView.arrangedSubviews.enumerated() {
            if let rating = Int(entry.rating.label) {
                star.alpha = index >= rating ? 0 : 1
            }
        }
    }
    
    func configureStarsStackView() {
        for _ in 0..<5 {
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            starsStackView.addArrangedSubview(imageView)
        }
        starsStackView.addArrangedSubview(UIView())
    }
    
    func configureCell() {
        backgroundColor = .customGray
        layer.cornerRadius = 16
        layer.masksToBounds = false
        
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        
        configureStarsStackView()
        
        let padding: CGFloat = 16
        
        let horizontalStackView = UIStackView(arrangedSubviews: [titleLabel, authorLabel])
        horizontalStackView.spacing = 8
        
        let verticalStackView = UIStackView(arrangedSubviews: [horizontalStackView, starsStackView, bodyLabel, UIView()])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        
        addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding)
        ])
    }
}
