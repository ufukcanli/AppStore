//
//  ASBodyLabel.swift
//  AppStore
//
//  Created by Ufuk Canlı on 10.02.2021.
//

import UIKit

class ASBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        textAlignment = .left
        textColor = .darkText
        font = .preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
