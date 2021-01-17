//
//  SearchViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import UIKit

class SearchViewController: ASListViewController {
    
    let searchController = UISearchController()
    
    let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.text = "🧐 What are you looking for?"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var searchResults: [SearchResult] = []
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: make empty state better
        emptyStateLabel.isHidden = searchResults.count != 0
        return searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let searchResultCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.reuseIdentifier, for: indexPath) as! SearchResultCell
        searchResultCell.updateCell(withSearchResult: searchResults[indexPath.item])
        return searchResultCell
    }
    
    func configureSearchController() {
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for an app"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func configureViewController() {
        collectionView.backgroundColor = .systemBackground
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.reuseIdentifier)
                
        configureSearchController()
        
        collectionView.addSubview(emptyStateLabel)
        
        NSLayoutConstraint.activate([
            emptyStateLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 80),
            emptyStateLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
        ])
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 265)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // TODO: add loading view animation
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            SearchService.shared.fetchApps(searchTerm: searchText) { [weak self] result in
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
    }
}
