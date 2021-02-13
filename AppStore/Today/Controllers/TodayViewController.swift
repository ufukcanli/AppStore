//
//  TodayViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 13.02.2021.
//

import UIKit

class TodayViewController: ASListViewController {
    
    let detailScreen = TodayDetailViewController()
    var startingFrame: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    @objc func didTapDismissDetailView(_ gestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            gestureRecognizer.view?.frame = self.startingFrame ?? .zero
            self.detailScreen.view.layer.cornerRadius = 16
            
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
            }
        } completion: { _ in
            gestureRecognizer.view?.removeFromSuperview()
            
            self.detailScreen.willMove(toParent: nil)
            self.detailScreen.removeFromParent()
            self.detailScreen.view.removeFromSuperview()
        }
    }
    
    func configureViewController() {
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = .customGray
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.reuseIdentifier)
    }
}

extension TodayViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.reuseIdentifier, for: indexPath) as! TodayCell
        return cell
    }
}

extension TodayViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt")
        
        detailScreen.view.layer.cornerRadius = 16
        detailScreen.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapDismissDetailView)))
        view.addSubview(detailScreen.view)
        self.addChild(detailScreen)
        detailScreen.didMove(toParent: self)
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        detailScreen.view.frame = startingFrame
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            self.detailScreen.view.frame = self.view.frame // ending frame
            self.detailScreen.view.layer.cornerRadius = 0
            
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height
        }
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 64, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 0, bottom: 32, right: 0)
    }
}