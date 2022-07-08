//
//  PostsListController.swift
//  PostsApp
//
//  Created by Maria Jose Sanchez Cairazco on 6/07/22.
//

import UIKit
import Foundation

private struct PostsListControllerSegues {
    static let PostDetails = "segueToPostDetails"
}

class PostsListController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    // MARK: - @IBOutlets and other variables
    
    @IBOutlet private weak var postsTableView: UITableView?
    @IBOutlet private weak var segmentedControl: SegmentedControl?
    
    var index: Int = 0
    var posts: [Post] = []
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPosts()
        postsTableView?.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - TableView delegate and dataSource fucntions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListCell") as! PostListCell
        cell.load(posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: PostsListControllerSegues.PostDetails, sender: posts[indexPath.row])
    }
    
    // MARK: - Functions
    
    private func getPosts() {
        PostsApi().makePostsRequest(completion: { (posts,error)  in
            self.posts = posts
            self.reloadTable()
        })
    }
    
    private func reloadTable() {
        DispatchQueue.main.async {
            self.postsTableView?.reloadData()
        }
    }
    
    // MARK: - @IBActions
    
    @IBAction func valueChanged(_ sender: UIControl) {
        // switch segmentedControl?.selectedIndex {
        // case 0:
            
        // case 1:
            
        // default: break
        // }
    }
    
    // MARK: - Prepare function for segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            switch segue.identifier {
            case PostsListControllerSegues.PostDetails:
                let vc = segue.destination as! PostDetailsController
                vc.post = (sender as! Post)

            default:
                break
            }
        }
}
