//
//  CommentsViewController.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 07/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

class CommentsViewController: UITableViewController {
    
    var comments: Comment[]
    init(style: UITableViewStyle) {
        self.comments = Comment.comments()
        super.init(style: style)
    }
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let comment = comments[indexPath.row]
        
        cell.textLabel.text = comment.body
        return cell
    }

}

