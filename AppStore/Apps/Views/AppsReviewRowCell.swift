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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        backgroundColor = .systemBackground
        
        addSubview(horizontalViewController.view)
        horizontalViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalViewController.view.topAnchor.constraint(equalTo: self.topAnchor),
            horizontalViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalViewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            horizontalViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
