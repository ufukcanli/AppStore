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
    }
    
    func configureCell() {
        backgroundColor = .customGray
        layer.cornerRadius = 16
        layer.masksToBounds = false
        
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        
        let padding: CGFloat = 16
        
        let horizontalStackView = UIStackView(arrangedSubviews: [titleLabel, authorLabel])
        horizontalStackView.spacing = 8
        
        let verticalStackView = UIStackView(arrangedSubviews: [horizontalStackView, starsLabel, bodyLabel])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 12
        
        addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding)
        ])
    }
}
