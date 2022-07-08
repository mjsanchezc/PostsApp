//
//  PostsApi.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 7/07/22.
//

import Foundation

class PostsApi {
    func makePostsRequest(completion: @escaping (_ posts: [Post], _ error: Error?)->()) {
        let url = URL(string: ApiUrls.posts.rawValue)!
        
        let t = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let posts = try? JSONDecoder().decode([Post].self, from: data) {
                completion(posts, nil)
            } else {
                completion([], error)
                return
            }
        }
        
        t.resume()
    }
    
    func makeUserRequest(_ userId: Int, completion: @escaping (_ users: [User], _ error: Error?)->()) {
        var urlComponents = URLComponents(string: ApiUrls.users.rawValue)!
        urlComponents.queryItems = [ URLQueryItem(name: "id", value: String(userId)) ]
        
        let url = urlComponents.url!
        
        let t = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let users = try? JSONDecoder().decode([User].self, from: data) {
                completion(users, nil)
            } else {
                completion([], error)
                return
            }
        }
        
        t.resume()
    }
    
    func makeCommentsRequest(_ postId: Int,completion: @escaping (_ comments: [Comment], _ error: Error?)->()) {
        var urlComponents = URLComponents(string: ApiUrls.comments.rawValue)!
        urlComponents.queryItems = [ URLQueryItem(name: "postId", value: String(postId)) ]
        
        let url = urlComponents.url!
        
        let t = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let comments = try? JSONDecoder().decode([Comment].self, from: data) {
                completion(comments, nil)
            } else {
                completion([], error)
                return
            }
        }
        
        t.resume()
    }
}
