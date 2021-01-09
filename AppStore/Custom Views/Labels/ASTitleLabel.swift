//
//  ASTitleLabel.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

final class ASTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, size: CGFloat) {
        self.init(frame: .zero)
        self.text = text
        self.font = .boldSystemFont(ofSize: size)
    }
    
    private func configureCell() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
