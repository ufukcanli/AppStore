//
//  AppsHeaderView.swift
//  AppStore
//
//  Created by Ufuk Canlı on 10.01.2021.
//

import UIKit

class AppsHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "AppsHeaderView"
    
    let appsHeaderHorizontalViewController = AppsHeaderHorizontalViewController()
      
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeaderView() {
        backgroundColor = .systemBackground
        
        appsHeaderHorizontalViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(appsHeaderHorizontalViewController.view)
        
        NSLayoutConstraint.activate([
            appsHeaderHorizontalViewController.view.topAnchor.constraint(equalTo: self.topAnchor),
            appsHeaderHorizontalViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            appsHeaderHorizontalViewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            appsHeaderHorizontalViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
