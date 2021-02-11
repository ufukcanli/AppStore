//
//  AppsHeaderHorizontalViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 10.01.2021.
//

import UIKit

class AppsHeaderHorizontalViewController: ASHorizontalSnappingViewController {
    
    var appsSocial = [AppsSocial]()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsSocial.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appsHeaderCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderCell.reuseIdentifier, for: indexPath) as! AppsHeaderCell
        let appsSocialItem = appsSocial[indexPath.item]
        appsHeaderCell.updateCell(appsSocialItem: appsSocialItem)
        return appsHeaderCell
    }

    func configureViewController() {
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.isPagingEnabled = true
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: AppsHeaderCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

extension AppsHeaderHorizontalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 48, height: view.frame.height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    }
}
