//
//  TodayViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 13.02.2021.
//

import UIKit

class TodayViewController: ASListViewController {
    
    var detailViewController: TodayDetailViewController!
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    var startingFrame: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    @objc func didTapDismissDetailView(_ gestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            
            self.view.layoutIfNeeded() // starts animation
            self.detailViewController.tableView.scrollToRow(at: [0, 0], at: .top, animated: true)
            self.detailViewController.tableView.showsVerticalScrollIndicator = false
            
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
            }
        } completion: { _ in
            gestureRecognizer.view?.removeFromSuperview()
            
            self.detailViewController.willMove(toParent: nil)
            self.detailViewController.removeFromParent()
            self.detailViewController.view.removeFromSuperview()
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
        
        detailViewController = TodayDetailViewController()
        detailViewController.view.layer.cornerRadius = 16
        detailViewController.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapDismissDetailView)))
        view.addSubview(detailViewController.view)
        self.addChild(detailViewController)
        detailViewController.didMove(toParent: self)
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        
        detailViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.topConstraint = detailViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        self.leadingConstraint = detailViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        self.widthConstraint = detailViewController.view.widthAnchor.constraint(equalToConstant: startingFrame.width)
        self.heightConstraint = detailViewController.view.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach { $0?.isActive = true }
        
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {

            self.leadingConstraint?.constant = 0
            self.topConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded() // starts animation
            
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
