//
//  CommentsViewController.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 07/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

class CommentsViewController: UITableViewController {
    
    @lazy var comments: Comment[] = Comment.comments()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension
    }
    
    // #pragma mark - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Comment", forIndexPath: indexPath) as CommentsCell
        let comment = comments[indexPath.row]
        
//        cell.nameLabel.text = comment.user_name
//        cell.headlineLabel.text = comment.user_headline
        cell.bodyLabel.text = comment.body
        return cell
    }

}

