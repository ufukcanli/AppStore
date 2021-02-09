//
//  AppsViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 9.01.2021.
//

import UIKit

class AppsViewController: ASListViewController {
    
    var appsGroup = [AppsGroup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        
        fetchData()
    }
    
    func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        var group1: AppsGroup?
        var group2: AppsGroup?
        var group3: AppsGroup?
        
        dispatchGroup.enter()
        AppsService.shared.fetchAppsWeLove { result in
            dispatchGroup.leave()
            print("Done: fetchAppsWeLove")
            switch result {
            case .success(let appsGroup):
                group1 = appsGroup
            case .failure(let error):
                print(error)
            }
        }
        
        dispatchGroup.enter()
        AppsService.shared.fetchTopGrossing { result in
            dispatchGroup.leave()
            print("Done: fetchTopGrossing")
            switch result {
            case .success(let appsGroup):
                group2 = appsGroup
            case .failure(let error):
                print(error)
            }
        }
        
        dispatchGroup.enter()
        AppsService.shared.fetchTopFree { result in
            dispatchGroup.leave()
            print("Done: fetchTopFree")
            switch result {
            case .success(let appsGroup):
                group3 = appsGroup
            case .failure(let error):
                print(error)
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            print("Completed!")
            if let group1 = group1 { self.appsGroup.append(group1) }
            if let group2 = group2 { self.appsGroup.append(group2) }
            if let group3 = group3 { self.appsGroup.append(group3) }
            self.collectionView.reloadData()
        }
    }
    
    func configureViewController() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.reuseIdentifier)
        collectionView.register(AppsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsHeaderView.reuseIdentifier)
    }
}

extension AppsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsGroup.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appsGroupCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.reuseIdentifier, for: indexPath) as! AppsGroupCell
        let appsGroup = self.appsGroup[indexPath.item]
        appsGroupCell.updateCell(withTitle: appsGroup.feed.title, appsGroup: appsGroup)
        return appsGroupCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let appsHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsHeaderView.reuseIdentifier, for: indexPath) as! AppsHeaderView
        return appsHeaderView
    }
}

extension AppsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 275)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
    }
}
