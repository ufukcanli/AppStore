//
//  ASTabBarController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 8.01.2021.
//

import UIKit

final class ASTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarController()
    }
    
    private func configureTabBarController() {
//        tabBar.tintColor = .systemGreen
//        tabBar.barTintColor = .systemYellow
        
        viewControllers = [
            createNavigationController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavigationController(viewController: UIViewController(), title: "Apps", imageName: "apps"),
            createNavigationController(viewController: SearchViewController(), title: "Search", imageName: "search")
        ]
    }
    
    private func createNavigationController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navigationController.tabBarItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.image = UIImage(named: imageName)
        return navigationController
    }

}
