//
//  AppsViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

final class AppsViewController: ASListViewController {
    
    private var appsWeLove: AppsGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        
        // TODO: Add loading animation
        AppsService.shared.fetchApps { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let appsGroup):
                self.appsWeLove = appsGroup
                DispatchQueue.main.async { self.collectionView.reloadData() }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appsGroupCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.reuseIdentifier, for: indexPath) as! AppsGroupCell
        guard let appsWeLove = appsWeLove else { return appsGroupCell }
        appsGroupCell.updateCell(withTitle: appsWeLove.feed.title, appsWeLove: appsWeLove)
        return appsGroupCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let appsHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsHeaderView.reuseIdentifier, for: indexPath) as! AppsHeaderView
        return appsHeaderView
    }
    
    private func configureViewController() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.reuseIdentifier)
        collectionView.register(AppsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsHeaderView.reuseIdentifier)
    }
}

extension AppsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 275)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
    }
}
