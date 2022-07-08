//
//  User.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 8/07/22.
//

import Foundation

class User: Decodable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let website: String
}
