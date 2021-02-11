//
//  AppsPreviewCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 11.02.2021.
//

import UIKit

class AppsPreviewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsPreviewCell"
    
    let previewLabel = ASTitleLabel(text: "Previews", font: .boldSystemFont(ofSize: 20))
    let horizontalViewController = AppsPreviewHorizontalViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        backgroundColor = .systemBackground
        
        horizontalViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalViewController.view)
        addSubview(previewLabel)
        
        NSLayoutConstraint.activate([
            previewLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            previewLabel.topAnchor.constraint(equalTo: self.topAnchor),
            
            horizontalViewController.view.topAnchor.constraint(equalTo: previewLabel.bottomAnchor, constant: 10),
            horizontalViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalViewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            horizontalViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
