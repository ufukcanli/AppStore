//
//  AppsCompositionalViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 18.02.2021.
//

import UIKit

class AppsCompositionalViewController: UICollectionViewController {
        
    init() {
        super.init(collectionViewLayout: UIHelper.createCompositionalLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderCell.reuseIdentifier, for: indexPath) as! AppsHeaderCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsItemCell.reuseIdentifier, for: indexPath) as! AppsItemCell
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: CompositionalHeaderView.kind, withReuseIdentifier: CompositionalHeaderView.reuseIdentifier, for: indexPath)
        header.layer.cornerRadius = 8
        return header
    }
    
    private func configure() {
        navigationItem.title = "Apps"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsItemCell.self, forCellWithReuseIdentifier: AppsItemCell.reuseIdentifier)
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: AppsHeaderCell.reuseIdentifier)
        collectionView.register(CompositionalHeaderView.self, forSupplementaryViewOfKind: CompositionalHeaderView.kind, withReuseIdentifier: CompositionalHeaderView.reuseIdentifier)
    }
}
