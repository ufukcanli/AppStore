//
//  AppsHorizontalViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

class AppsHorizontalViewController: ASHorizontalSnappingViewController {
    
    var appsGroup: AppsGroup?
    var didSelectHandler: ((_ app: FeedResult) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    func configureViewController() {
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AppsItemCell.self, forCellWithReuseIdentifier: AppsItemCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

extension AppsHorizontalViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let appsGroup = appsGroup else { return 0 }
        return appsGroup.feed.results.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appsItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsItemCell.reuseIdentifier, for: indexPath) as! AppsItemCell
        guard let appsGroup = appsGroup else { return appsItemCell }
        appsItemCell.updateCell(withApp: appsGroup.feed.results[indexPath.item])
        return appsItemCell
    }
}

extension AppsHorizontalViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appsGroup?.feed.results[indexPath.item] {
            didSelectHandler?(app)
        }
    }
}

fileprivate let topBottomPadding: CGFloat = 12
fileprivate let lineSpacing: CGFloat = 10

extension AppsHorizontalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return CGSize(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: topBottomPadding, right: 0)
    }
}
