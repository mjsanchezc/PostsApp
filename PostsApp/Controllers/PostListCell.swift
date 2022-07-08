//
//  PostListCell.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 7/07/22.
//

import UIKit
import Foundation

class PostListCell: UITableViewCell {
    @IBOutlet private weak var statusImageView: UIImageView?
    @IBOutlet private weak var cellDescriptionLabel: UILabel?
    
    func load(_ post: Post) {
        cellDescriptionLabel?.text = post.title
    }
}
