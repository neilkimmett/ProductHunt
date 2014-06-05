//
//  MasterViewController.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 04/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, ItemFetcherDelegate {

    var detailViewController: DetailViewController? = nil
    var fetcher: ItemFetcher?
    var items: Item[]?

    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetcher = ItemFetcher(delegate: self)
        self.fetcher?.fetch()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.endIndex-1].topViewController as? DetailViewController
        }
    }
    
    func itemFetcherDidFetchItems(items : Item[]) {
        self.items = items
        self.tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let indexPath = self.tableView.indexPathForSelectedRow()
        if let item = self.items?[indexPath.row] {
            if segue.identifier == "showDetail" {
                ((segue.destinationViewController as UINavigationController).topViewController as DetailViewController).detailItem = item
            }
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
            cell.textLabel.text = item.title
            cell.detailTextLabel.text = item.subtitle
        }
        else {
            cell.textLabel.text = "no items"
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let item = items?[indexPath.row]
            self.detailViewController!.detailItem = item
        }
    }


}
