//
//  AppsDetailViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 10.02.2021.
//

import UIKit

class AppsDetailViewController: ASListViewController {
    
    var appId: String!
    var app: SearchResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchAppDetailInfo()
    }
    
    func fetchAppDetailInfo() {
        let url = URL(string: "https://itunes.apple.com/lookup?id=\(appId!)")!
        AppsService.shared.taskForGetRequest(url: url) { [weak self] (result: Result<ResultArray, ASError>) in
            guard let self = self else { return }
            switch result {
            case .success(let resultArray):
                self.app = resultArray.results.first
                DispatchQueue.main.async { self.collectionView.reloadData() }
            case .failure(let error):
                print(error)
            }
        }
    }

    func configureViewController() {
        navigationItem.largeTitleDisplayMode = .never
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsDetailCell.self, forCellWithReuseIdentifier: AppsDetailCell.reuseIdentifier)
        collectionView.register(AppsPreviewCell.self, forCellWithReuseIdentifier: AppsPreviewCell.reuseIdentifier)
    }
}

extension AppsDetailViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let appsDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsDetailCell.reuseIdentifier, for: indexPath) as! AppsDetailCell
            if let app = app { appsDetailCell.updateCell(app: app) }
            return appsDetailCell
        } else {
            let appsPreviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsPreviewCell.reuseIdentifier, for: indexPath) as! AppsPreviewCell
            return appsPreviewCell
        }
    }
}

extension AppsDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            let dummyCell = AppsDetailCell(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1000))
            if let app = app { dummyCell.updateCell(app: app) }
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: view.frame.width, height: 1000))
            return CGSize(width: view.frame.width, height: estimatedSize.height)
        } else {
            return CGSize(width: view.frame.width, height: 500)
        }
    }
}
