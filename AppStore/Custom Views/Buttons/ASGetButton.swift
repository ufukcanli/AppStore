//
//  ASGetButton.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

final class ASGetButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        backgroundColor = .systemGray4
        setTitle("GET", for: .normal)
        layer.cornerRadius = 16
        setTitleColor(.systemBlue, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 14)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 80),
            self.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
