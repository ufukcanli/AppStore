//
//  AppsPreviewHorizontalViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 11.02.2021.
//

import UIKit

class AppsPreviewHorizontalViewController: ASHorizontalSnappingViewController {
    
    var app: SearchResult? { didSet { collectionView.reloadData() } }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    func configureViewController() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsScreenshotCell.self, forCellWithReuseIdentifier: AppsScreenshotCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension AppsPreviewHorizontalViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let app = app else { return 0 }
        return app.screenshotUrls.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsScreenshotCell.reuseIdentifier, for: indexPath) as! AppsScreenshotCell
        if let app = app { cell.updateCell(screenshotURLString: app.screenshotUrls[indexPath.item]) }
        return cell
    }
}

extension AppsPreviewHorizontalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: view.frame.height) // view is cell itself.
    }
}
