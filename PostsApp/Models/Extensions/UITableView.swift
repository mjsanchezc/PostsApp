//
//  UITableView.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 8/07/22.
//

import Foundation
import UIKit

//protocol RefreshTableViewDelegate: UITableViewDelegate {
//    func tableView(didRequestRefresh: UITableView)
//}

//class RefreshTableView: UITableView {
//    @IBInspectable var refreshTintColor: UIColor? {
//        didSet {
//            self.refreshControl?.tintColor = refreshTintColor
//        }
//    }
//
//    override func awakeFromNib() {
//        self.addRefresh()
//    }
//
//    private func addRefresh() {
//        self.refreshControl = UIRefreshControl()
//        self.refreshControl?.addTarget(self, action: #selector(self.didRequestRefresh), for: .valueChanged)
//        self.refreshControl?.tintColor = refreshTintColor
//    }

//    override func reloadData() {
//        super.reloadData()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            self.refreshControl?.endRefreshing()
//        }
//    }

//    @objc private func didRequestRefresh() {
//        (delegate as? RefreshTableViewDelegate)?.tableView(didRequestRefresh: self)
//    }
//
//}
