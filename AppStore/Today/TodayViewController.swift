//
//  TodayViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 13.02.2021.
//

import UIKit

class TodayViewController: ASListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    func configureViewController() {
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = .customGray
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.reuseIdentifier)
    }
}

extension TodayViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.reuseIdentifier, for: indexPath) as! TodayCell
        return cell
    }
}

extension TodayViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt")
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 64, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 0, bottom: 32, right: 0)
    }
}
