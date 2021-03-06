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
    var reviews: AppsReviews?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchAppDetails()
    }
    
    func fetchAppDetails() {
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
        
        let reviewsURL = URL(string: "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId!)/sortby=mostrecent/json")!
        AppsService.shared.taskForGetRequest(url: reviewsURL) { [weak self] (result: Result<AppsReviews, ASError>) in
            guard let self = self else { return }
            switch result {
            case .success(let appsReviews):
                self.reviews = appsReviews
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
        collectionView.register(AppsReviewRowCell.self, forCellWithReuseIdentifier: AppsReviewRowCell.reuseIdentifier)
    }
}

extension AppsDetailViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let appsDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsDetailCell.reuseIdentifier, for: indexPath) as! AppsDetailCell
            if let app = app { appsDetailCell.updateCell(app: app) }
            return appsDetailCell
        } else if indexPath.item == 1 {
            let appsPreviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsPreviewCell.reuseIdentifier, for: indexPath) as! AppsPreviewCell
            if let app = app { appsPreviewCell.horizontalViewController.app = app }
            return appsPreviewCell
        } else {
            let appsReviewRowCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsReviewRowCell.reuseIdentifier, for: indexPath) as! AppsReviewRowCell
            if let reviews = reviews { appsReviewRowCell.horizontalViewController.reviews = reviews }
            return appsReviewRowCell
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
        } else if indexPath.item == 1 {
            return CGSize(width: view.frame.width, height: 500)
        } else {
            return CGSize(width: view.frame.width, height: 250)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
    }
}
