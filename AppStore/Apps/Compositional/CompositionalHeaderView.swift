//
//  CompositionalHeaderView.swift
//  AppStore
//
//  Created by Ufuk Canlı on 18.02.2021.
//

import UIKit

class CompositionalHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "CompositionalHeaderView"
    static let kind = UICollectionView.elementKindSectionHeader
    
    let headerTitleLabel = ASTitleLabel(text: "Editor's Choice Apps", font: .boldSystemFont(ofSize: 28))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(headerTitleLabel)
        
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
