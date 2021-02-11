//
//  AppsPreviewCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 11.02.2021.
//

import UIKit

class AppsPreviewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsPreviewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        backgroundColor = .systemRed
    }
}
