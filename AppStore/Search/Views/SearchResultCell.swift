//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import UIKit
import SDWebImage

final class SearchResultCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SearchResultCell"
    
    private let appIconImageView = UIImageView()
    private let nameLabel = UILabel()
    private let categoryLabel = UILabel()
    private let ratingsLabel = UILabel()
    private let getButton = UIButton(type: .system)
    private lazy var screenshotImageView0 = self.createScreenshotImageView()
    private lazy var screenshotImageView1 = self.createScreenshotImageView()
    private lazy var screenshotImageView2 = self.createScreenshotImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(withSearchResult searchResult: SearchResult) {
        nameLabel.text = searchResult.trackName
        categoryLabel.text = searchResult.primaryGenreName
        ratingsLabel.text = String(searchResult.averageUserRating ?? 0)
        
        appIconImageView.sd_setImage(with: URL(string: searchResult.artworkUrl100))
        
        if searchResult.screenshotUrls.count > 0 {
            screenshotImageView0.sd_setImage(with: URL(string: searchResult.screenshotUrls[0]))
        }
        if searchResult.screenshotUrls.count > 1 {
            screenshotImageView1.sd_setImage(with: URL(string: searchResult.screenshotUrls[1]))
        }
        if searchResult.screenshotUrls.count > 2 {
            screenshotImageView2.sd_setImage(with: URL(string: searchResult.screenshotUrls[2]))
        }
    }
    
    private func configureAppIconImageView() {
//        appIconImageView.backgroundColor = .systemRed
        appIconImageView.layer.cornerRadius = 12
        appIconImageView.clipsToBounds = true
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
        let screenshotImageView = UIImageView()
//        screenshotImageView.backgroundColor = .systemBlue
        screenshotImageView.layer.cornerRadius = 8
        screenshotImageView.layer.borderWidth = 0.5
        screenshotImageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        screenshotImageView.clipsToBounds = true
        return screenshotImageView
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
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshotImageView0, screenshotImageView1, screenshotImageView2])
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
