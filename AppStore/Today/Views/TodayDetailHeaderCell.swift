//
//  TodayDetailHeaderCell.swift
//  AppStore
//
//  Created by Ufuk Canlı on 16.02.2021.
//

import UIKit

class TodayDetailHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    let closeButton = UIButton(type: .system)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        todayCell.translatesAutoresizingMaskIntoConstraints = false
        addSubview(todayCell)
        
        closeButton.setImage(#imageLiteral(resourceName: "close_button").withRenderingMode(.alwaysTemplate), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            todayCell.topAnchor.constraint(equalTo: self.topAnchor),
            todayCell.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            todayCell.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            todayCell.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            closeButton.widthAnchor.constraint(equalToConstant: 80),
            closeButton.heightAnchor.constraint(equalToConstant: 38),
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
