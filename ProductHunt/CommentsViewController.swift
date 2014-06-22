//
//  CommentsViewController.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 07/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

class CommentsViewController: UITableViewController, ProductHuntClientCommentsDelegate {
    var item: Item? = nil
    var comments: Comment[]? = nil
    let apiClient = ProductHuntClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let i = self.item {
            self.apiClient.commentsDelegate = self
            self.apiClient.fetchCommentsForItem(i)
        }
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }
    
    // #pragma mark - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let comments = self.comments {
            return comments.count
        }
        else {
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Comment", forIndexPath: indexPath) as CommentsCell
        
        if let comment = comments?[indexPath.row] {
            cell.nameLabel.text = comment.user.name
            cell.headlineLabel.text = comment.user.username
            cell.bodyLabel.text = comment.comment
        }
        else {
            cell.textLabel.text = "Loading..."
        }
        return cell
    }
    
    func productHuntClientDidFetchComments(comments: Comment[]) {
        self.comments = comments
        self.tableView.reloadData()
    }
}

