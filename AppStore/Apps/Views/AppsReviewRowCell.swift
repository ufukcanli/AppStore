//
//  AppsReviewRowCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 12.02.2021.
//

import UIKit

class AppsReviewRowCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsReviewRowCell"
    
    let horizontalViewController = AppsReviewsHorizontalViewController()
    let cellTitleLabel = ASTitleLabel(text: "Reviews & Rating", font: .boldSystemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        backgroundColor = .systemBackground
        
        let padding: CGFloat = 16
        
        addSubview(cellTitleLabel)
        
        addSubview(horizontalViewController.view)
        horizontalViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            cellTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            
            horizontalViewController.view.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 10),
            horizontalViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalViewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            horizontalViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
