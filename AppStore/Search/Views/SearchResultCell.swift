//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import UIKit
import SDWebImage

class SearchResultCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SearchResultCell"
    
    let appIconImageView = ASAppIconImageView(width: 64, height: 64)
    let getButton = ASGetButton(backgroundColor: .customGray, title: "GET")
    let nameLabel = UILabel()
    let categoryLabel = UILabel()
    let ratingsLabel = UILabel()
    lazy var screenshotImageView0 = self.createScreenshotImageView()
    lazy var screenshotImageView1 = self.createScreenshotImageView()
    lazy var screenshotImageView2 = self.createScreenshotImageView()

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
    
    func configureLabels() {
        nameLabel.text = "APP NAME"
        categoryLabel.text = "Photos & Video"
        ratingsLabel.text = "9.26M"
    }
    
    func createScreenshotImageView() -> UIImageView {
        let screenshotImageView = UIImageView()
//        screenshotImageView.backgroundColor = .systemBlue
        screenshotImageView.layer.cornerRadius = 8
        screenshotImageView.layer.borderWidth = 0.5
        screenshotImageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        screenshotImageView.clipsToBounds = true
        return screenshotImageView
    }
    
    func configureCell() {
//        backgroundColor = .systemGreen
                
        configureLabels()
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelStackView.axis = .vertical
        
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
            containerStackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            containerStackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
}
