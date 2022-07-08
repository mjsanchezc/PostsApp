//
//  Post.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 7/07/22.
//

import Foundation

struct Post {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum SegmentSelection: Int {
    case all = 0
    case fav = 1
}
