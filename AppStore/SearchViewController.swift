//
//  SearchViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import UIKit

class SearchViewController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .systemRed
    }

}
