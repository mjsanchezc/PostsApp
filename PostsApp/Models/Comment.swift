//
//  Comment.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 7/07/22.
//

import Foundation

class Comment: Decodable {
    let postId: Int
    let body: String
}
