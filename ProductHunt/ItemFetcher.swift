//
//  ItemFetcher.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 04/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import Foundation
import UIKit

protocol ItemFetcherDelegate {
    func itemFetcherDidFetchItems(items : Item[])
}

class ItemFetcher {
    
    var delegate: ItemFetcherDelegate?
    
    init(delegate: ItemFetcherDelegate) {
        self.delegate = delegate
    }
    
    func fetch() {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession.sharedSession()
        let url = "http://www.kimonolabs.com/api/2mlneeiq?apikey=6a6c754cee1c3f23d02dd1a8f3a76615"
        let task = session.dataTaskWithURL(NSURL(string: url), completionHandler: { (data, response, error) in
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            
            var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(), error: nil) as NSDictionary
//            var json = [["title": "HookFeed", "subtitle": "Customer Analytics for Stripe", "url": "http://www.producthunt.com/l/50bd8456b2"]]
            if let itemsJSON = json["results"]?["items"] as? NSDictionary[] {
                let items = itemsJSON.map { (itemJSON: NSDictionary) -> Item in
                    let url = itemJSON["title"]?["href"] as String
                    let title = itemJSON["title"]?["text"] as String
                    let subtitle = itemJSON["subtitle"] as String
                    let avatar_url = itemJSON["avatar_url"]?["src"] as String
                    return Item(url: url, title: title, subtitle: subtitle, avatar_url: NSURL(string: avatar_url))
                }
                self.delegate?.itemFetcherDidFetchItems(items)
            }
        })
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        task.resume()
    }
}
