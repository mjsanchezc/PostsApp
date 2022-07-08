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
    @IBOutlet private weak var postsTableView: UITableView?
    @IBOutlet private weak var segmentedControl: SegmentedControl?
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTableView?.rowHeight = UITableView.automaticDimension
        
        if let segmentedIndex = segmentedControl?.selectedIndex {
            index = segmentedIndex
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView?.dequeueReusableCell(withIdentifier: "PostListCell") as! PostListCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: PostsListControllerSegues.PostDetails, sender: nil)
    }
    
    @IBAction func valueChanged(_ sender: UIControl) {
        // switch segmentedControl?.selectedIndex {
        // case 0:
            
        // case 1:
            
        // default: break
        // }
    }
}
