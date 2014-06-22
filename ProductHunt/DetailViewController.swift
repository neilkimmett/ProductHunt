//
//  DetailViewController.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 04/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, UISplitViewControllerDelegate {

    @IBOutlet var webView: UIWebView
    @IBOutlet var placeholderView: UIView
    
    var masterPopoverController: UIPopoverController? = nil
    
    var detailItem: Item? {
        didSet {
            self.title = detailItem?.title
            self.configureView()
            
            self.masterPopoverController?.dismissPopoverAnimated(true)
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Item = self.detailItem {
            let req = NSURLRequest(URL: NSURL(string: detail.url))

            self.webView?.loadRequest(req)
            
            if let placeholder = self.placeholderView {
                placeholder.hidden = true
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem()
    }

    // #pragma mark - Split view

    func splitViewController(splitController: UISplitViewController, willHideViewController viewController: UIViewController, withBarButtonItem barButtonItem: UIBarButtonItem, forPopoverController popoverController: UIPopoverController) {
        barButtonItem.title = "Posts"
        self.navigationItem.setLeftBarButtonItem(barButtonItem, animated: true)
        self.masterPopoverController = popoverController
    }

    func splitViewController(splitController: UISplitViewController, willShowViewController viewController: UIViewController, invalidatingBarButtonItem barButtonItem: UIBarButtonItem) {
        // Called when the view is shown again in the split view, invalidating the button and popover controller.
        self.navigationItem.setLeftBarButtonItem(nil, animated: true)
        self.masterPopoverController = nil
    }
    func splitViewController(splitController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return true
    }

}

