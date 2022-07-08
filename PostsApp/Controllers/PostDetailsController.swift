//
//  PostDetailsController.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 7/07/22.
//

import UIKit
import Foundation

class PostDetailsController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    @IBOutlet private weak var postDescriptionLabel: UILabel?
    @IBOutlet private weak var postNameLabel: UILabel?
    @IBOutlet private weak var postEmailLabel: UILabel?
    @IBOutlet private weak var postPhoneLabel: UILabel?
    @IBOutlet private weak var postWebsiteLabel: UILabel?
    @IBOutlet private weak var commentsTableView: UITableView?
    @IBOutlet private weak var loaderUserView: UIActivityIndicatorView?
    
    var post: Post?
    var comments: [Comment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let post = post {
            loadPost(post)
        }
    }
    
    // MARK: - TableView delegate and dataSource fucntions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentsTableView?.dequeueReusableCell(withIdentifier: "CommentsCell") as! CommentsCell
        cell.load(comments[indexPath.row])
        
        return cell
    }
    
    // MARK: - Functions
    
    private func loadPost(_ post: Post) {
        postDescriptionLabel?.text = post.body
        
        getUser(post.userId)
        getComments(post.id)
    }
    
    private func getUser(_ userId: Int) {
        animateLoader()
        
        PostsApi().makeUserRequest(userId,completion: { (users,error)  in
            self.hideLoader()
            if error != nil { return }
            
            if let user = users.first {
                self.loadUser(user)
            }
        })
    }
    
    private func loadUser(_ user: User) {
        DispatchQueue.main.async {
            self.postNameLabel?.text = "Name - \(user.name)"
            self.postEmailLabel?.text = "Email - \(user.email)"
            self.postPhoneLabel?.text = "Phone - \(user.phone)"
            self.postWebsiteLabel?.text = "Website - \(user.website)"
        }
    }
    
    private func getComments(_ postId: Int) {
        PostsApi().makeCommentsRequest(postId, completion: { (comments,error) in
            self.comments = comments
            self.reloadComments()
        })
    }
    
    private func reloadComments() {
        DispatchQueue.main.async {
            self.commentsTableView?.reloadData()
        }
    }
    
    private func animateLoader() {
        DispatchQueue.main.async {
            self.loaderUserView?.isHidden = false
            self.loaderUserView?.startAnimating()
        }
    }
    
    private func hideLoader() {
        DispatchQueue.main.async {
            self.loaderUserView?.isHidden = true
            self.loaderUserView?.stopAnimating()
        }
    }
}
