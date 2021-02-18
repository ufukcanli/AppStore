//
//  ASAppIconImageView.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

class ASAppIconImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(width: CGFloat, height: CGFloat) {
        self.init(frame: .zero)
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func configureImageView() {
        backgroundColor = .systemPink
        layer.cornerRadius = 12
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
