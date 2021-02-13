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
        if indexPath.row == 0 {
            return 350
        } else {
            return 450
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = UITableViewCell()
            let todayCell = TodayCell()
            cell.addSubview(todayCell)
            todayCell.translatesAutoresizingMaskIntoConstraints = false
            todayCell.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            todayCell.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            return cell
        } else {
            let cell = TodayDetailDescriptionCell()
            return cell
        }
    }
}
