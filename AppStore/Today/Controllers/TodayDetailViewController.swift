//
//  TodayDetailViewController.swift
//  AppStore
//
//  Created by Ufuk Canlı on 13.02.2021.
//

import UIKit

class TodayDetailViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
}

extension TodayDetailViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 350 }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 { return TodayDetailHeaderCell() }
        return TodayDetailDescriptionCell()
    }
}
