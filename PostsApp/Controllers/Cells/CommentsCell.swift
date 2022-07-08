//
//  CommentsCell.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 7/07/22.
//

import UIKit
import Foundation

class CommentsCell: UITableViewCell {
    @IBOutlet private weak var commentBodyLabel: UILabel?
    
    func load(_ comment: Comment) {
        commentBodyLabel?.text = comment.body
    }
}
