//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

final class AppsGroupCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsGroupCell"
    
    private let titleLabel = UILabel()
    private let horizontalViewController = AppsHorizontalViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        titleLabel.text = "Apps Section"
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCell() {
        backgroundColor = .systemPurple
        
        configureLabel()
        addSubview(titleLabel)
        
        horizontalViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalViewController.view)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            
            horizontalViewController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            horizontalViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontalViewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
