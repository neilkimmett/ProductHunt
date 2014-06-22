//
//  ProductHuntClient.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 22/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

protocol ProductHuntClientDelegate {
    func productHuntClientDidFetchItems(items: Item[])
}

class ProductHuntClient {
    let baseURL = NSURL(string: "http://hook-api.herokuapp.com")
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession.sharedSession()
    var delegate: ProductHuntClientDelegate? = nil
    
    func fetchItems() {
        let url = baseURL.URLByAppendingPathComponent("today")
        let task = session.dataTaskWithURL(url, completionHandler: { (data, response, error) in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            self.parseItemsFromData(data)
        })
        task.resume()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func parseItemsFromData(data: NSData) {
        var error : NSError?
        var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(), error: &error) as NSDictionary
        let hunts = json["hunts"]! as NSDictionary[]
        let items = hunts.map { (itemJSON: NSDictionary) -> Item in
            println(itemJSON["url"]!)
            let url = String(itemJSON["url"]! as NSString)
            let permalink = String(itemJSON["permalink"]! as NSString)
            
            let comment_count = itemJSON["comment_count"].integerValue
            let rank = Int(itemJSON["rank"]! as NSNumber)
            let votes = Int(itemJSON["votes"]! as NSNumber)
            
            let title = String(itemJSON["title"]! as NSString)
            let tagline = String(itemJSON["tagline"]! as NSString)
            
            let user = self.parseUserFromDict(itemJSON["user"] as NSDictionary)
            
            return Item(url: url, permalink: permalink, comment_count: comment_count, rank: rank, votes: votes, title: title, tagline: tagline, user: user)
        }
        self.delegate?.productHuntClientDidFetchItems(items)
    }
    
    func parseUserFromDict(dict: NSDictionary) -> User {
        let name = String(dict["name"]! as NSString)
        let username = String(dict["username"]! as NSString)
        return User(name: name, username: username)
    }
   
}
