//
//  TodayDetailDescriptionCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 13.02.2021.
//

import UIKit

class TodayDetailDescriptionCell: UITableViewCell {
    
    let descriptionTextLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        let padding: CGFloat = 24
                
        let attributedText = NSMutableAttributedString(string: "Great games", attributes: [.foregroundColor: UIColor.darkText])
        attributedText.append(NSAttributedString(string: " are all about the details, from subtle visual effects to imaginative art styles. In these titles, you're sure to find something to marvel at, whether you're into fantasy worlds or neon-soaked dartboards.", attributes: [.foregroundColor: UIColor.darkGray]))
        attributedText.append(NSAttributedString(string: "\n\n\nHeroic adventure", attributes: [.foregroundColor: UIColor.darkText]))
        attributedText.append(NSAttributedString(string: "\nBattle in dungeons. Collect treasure. Solve puzzles. Sail to new lands. Oceanhorn lets you do it all in a beautifully detailed world.", attributes: [.foregroundColor: UIColor.darkGray]))
        
        descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextLabel.font = .systemFont(ofSize: 20, weight: .regular)
        descriptionTextLabel.attributedText = attributedText
        descriptionTextLabel.numberOfLines = 0
        
        addSubview(descriptionTextLabel)
    
        NSLayoutConstraint.activate([
            descriptionTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            descriptionTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding)
        ])
    }
}
