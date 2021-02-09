//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsGroupCell"
    
    let titleLabel = ASTitleLabel(text: "App Name", font: .boldSystemFont(ofSize: 24))
    let horizontalViewController = AppsHorizontalViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(withTitle title: String, appsGroup: AppsGroup) {
        titleLabel.text = title
        horizontalViewController.appsGroup = appsGroup
        horizontalViewController.collectionView.reloadData()
    }
    
    func configureCell() {
//        backgroundColor = .systemPurple
        
        addSubview(titleLabel)
        
        horizontalViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalViewController.view)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            
            horizontalViewController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            horizontalViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontalViewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
