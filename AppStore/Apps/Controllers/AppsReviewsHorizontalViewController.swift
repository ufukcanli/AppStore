//
//  AppsReviewsHorizontalViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 12.02.2021.
//

import UIKit

class AppsReviewsHorizontalViewController: ASHorizontalSnappingViewController {
    
    var reviews: AppsReviews? { didSet { collectionView.reloadData() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    func configureViewController() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsReviewCell.self, forCellWithReuseIdentifier: AppsReviewCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension AppsReviewsHorizontalViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let reviews = reviews else { return 0 }
        return reviews.feed.entry.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appsReviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsReviewCell.reuseIdentifier, for: indexPath) as! AppsReviewCell
        if let entry = self.reviews?.feed.entry[indexPath.item] { appsReviewCell.updateCell(entry: entry) }
        return appsReviewCell
    }
}

extension AppsReviewsHorizontalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
