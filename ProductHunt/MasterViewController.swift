//
//  MasterViewController.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 04/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, ProductHuntClientDelegate {

    var detailViewController: DetailViewController? = nil
    var items: Item[]?
    let apiClient = ProductHuntClient()

    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiClient.delegate = self
        self.apiClient.fetchItems()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.endIndex-1].topViewController as? DetailViewController
            split.preferredDisplayMode = .AllVisible
        }
    }

    // #pragma mark - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
            case "showDetail":
                let indexPath = self.tableView.indexPathForSelectedRow()
                if let item = self.items?[indexPath.row] {
                    let nav = segue.destinationViewController as UINavigationController
                    let detail = nav.topViewController as DetailViewController
                    detail.detailItem = item
                }
            case "showComments":
                if let cell = sender?.superview?.superview? as? UITableViewCell {
                    
                    let indexPath = self.tableView.indexPathForCell(cell)
                    if let item = self.items?[indexPath.row] {
                        let nav = segue.destinationViewController as UINavigationController
                        let detail = nav.topViewController as CommentsViewController
                        detail.item = item
                    }

                    self.tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None)
                }
            default:
                break
        }
    }
    
    // #pragma mark - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = self.items {
            return items.count
        }
        else {
            return 1
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        if let items = self.items {
            let item = items[indexPath.row]

            let underlineColor = UIColor(white: 0, alpha: 0.098)
            var attrs :NSDictionary = [
                NSUnderlineColorAttributeName: underlineColor,
                NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.toRaw()
            ]
            cell.textLabel.attributedText = NSAttributedString(string: item.title, attributes: attrs)
            cell.detailTextLabel.text = item.tagline
//            var data = NSData(contentsOfURL: item.avatar_url)
//            cell.imageView.image = UIImage(data: data)
        }
        else {
            cell.textLabel.text = "Loading..."
            cell.detailTextLabel.text = nil
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let item = items?[indexPath.row]
            self.detailViewController!.detailItem = item
        }
    }

    // #pragma mark - ProductHuntClientDelegate

    func productHuntClientDidFetchItems(items: Item[]) {
        self.items = items
        println(items)
        self.tableView.reloadData()
    }

}

