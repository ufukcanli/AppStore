//
//  AppsHorizontalViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

final class AppsHorizontalViewController: ASListViewController {
    
    public var appsWeLove: AppsGroup?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let appsWeLove = appsWeLove else { return 0 }
        return appsWeLove.feed.results.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appsItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsItemCell.reuseIdentifier, for: indexPath) as! AppsItemCell
        guard let appsWeLove = appsWeLove else { return appsItemCell }
        appsItemCell.updateCell(withApp: appsWeLove.feed.results[indexPath.item])
        return appsItemCell
    }
    
    private func configureViewController() {
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AppsItemCell.self, forCellWithReuseIdentifier: AppsItemCell.reuseIdentifier)
        if let collectionViewLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.scrollDirection = .horizontal
        }
    }
}

extension AppsHorizontalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 48, height: (view.frame.height - 32) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
