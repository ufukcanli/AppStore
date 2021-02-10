//
//  ASGetButton.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

class ASGetButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String, color: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitleColor(color, for: .normal)
        setTitle(title, for: .normal)
    }
    
    func configureButton() {
        layer.cornerRadius = 16
        titleLabel?.font = .boldSystemFont(ofSize: 14)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 80).isActive = true
        heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}
