//
//  SearchViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import UIKit

final class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var searchResults: [SearchResult] = []
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        
        NetworkManager.shared.fetchApps { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let results):
                self.searchResults = results.results
                DispatchQueue.main.async { self.collectionView.reloadData() }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let searchResultCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.reuseIdentifier, for: indexPath) as! SearchResultCell
        let searchResult = searchResults[indexPath.item]
        searchResultCell.updateCell(name: searchResult.trackName, category: searchResult.primaryGenreName, ratings: String(searchResult.averageUserRating ?? 0))
        return searchResultCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
    
    private func configureViewController() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.reuseIdentifier)
    }

}
