//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import UIKit

final class SearchResultCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SearchResultCell"
    
    private let appIconImageView = UIImageView()
    private let nameLabel = UILabel()
    private let categoryLabel = UILabel()
    private let ratingsLabel = UILabel()
    private let getButton = UIButton(type: .system)
    private lazy var screenShotImageView1 = self.createScreenshotImageView()
    private lazy var screenShotImageView2 = self.createScreenshotImageView()
    private lazy var screenShotImageView3 = self.createScreenshotImageView()


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(name: String, category: String, ratings: String) {
        nameLabel.text = name
        categoryLabel.text = category
        ratingsLabel.text = ratings
    }
    
    private func configureAppIconImageView() {
        appIconImageView.backgroundColor = .systemRed
        appIconImageView.layer.cornerRadius = 12
        appIconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLabels() {
        nameLabel.text = "APP NAME"
        categoryLabel.text = "Photos & Video"
        ratingsLabel.text = "9.26M"
    }
    
    private func configureGetButton() {
        getButton.backgroundColor = .systemGray4
        getButton.setTitle("GET", for: .normal)
        getButton.layer.cornerRadius = 16
        getButton.setTitleColor(.systemBlue, for: .normal)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        getButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        return imageView
    }
    
    private func configureCell() {
//        backgroundColor = .systemGreen
        
        configureAppIconImageView()
        
        configureLabels()
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelStackView.axis = .vertical
        
        configureGetButton()
        
        let infoStackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView, getButton])
        infoStackView.alignment = .center
        infoStackView.spacing = 10
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenShotImageView1, screenShotImageView2, screenShotImageView3])
        screenshotStackView.spacing = 10
        screenshotStackView.distribution = .fillEqually
        
        let containerStackView = UIStackView(arrangedSubviews: [infoStackView, screenshotStackView])
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        containerStackView.spacing = 10
        
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            appIconImageView.widthAnchor.constraint(equalToConstant: 64),
            appIconImageView.heightAnchor.constraint(equalToConstant: 64),
            
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 32),
            
            containerStackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
}
