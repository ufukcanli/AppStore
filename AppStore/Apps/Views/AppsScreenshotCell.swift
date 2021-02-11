//
//  AppsScreenshotCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 11.02.2021.
//

import UIKit

class AppsScreenshotCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppsScreenshotCell"
    
    let screenshotImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(screenshotURLString: String) {
        guard let screenshotURL = URL(string: screenshotURLString) else { return }
        screenshotImageView.sd_setImage(with: screenshotURL)
    }
    
    func configureCell() {
        screenshotImageView.layer.cornerRadius = 16
        screenshotImageView.layer.masksToBounds = true
        screenshotImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(screenshotImageView)
        
        NSLayoutConstraint.activate([
            screenshotImageView.topAnchor.constraint(equalTo: self.topAnchor),
            screenshotImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            screenshotImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            screenshotImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
