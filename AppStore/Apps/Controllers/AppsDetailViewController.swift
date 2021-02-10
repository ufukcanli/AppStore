//
//  AppsDetailViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 10.02.2021.
//

import UIKit

class AppsDetailViewController: ASListViewController {
    
    var appId: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Here is my app id: \(appId!)")
        let url = URL(string: "https://itunes.apple.com/lookup?id=\(appId!)")!
        AppsService.shared.taskForGetRequest(url: url) { (result: Result<ResultArray, ASError>) in
            switch result {
            case .success(let resultArray):
                print(resultArray.results.first?.releaseNotes as Any)
            case .failure(let error):
                print(error)
            }
        }
    }

    func configureViewController() {
        navigationItem.largeTitleDisplayMode = .never
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AppsDetailCell.self, forCellWithReuseIdentifier: AppsDetailCell.reuseIdentifier)
    }
}

extension AppsDetailViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsDetailCell.reuseIdentifier, for: indexPath) as! AppsDetailCell
        return cell
    }
}

extension AppsDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
