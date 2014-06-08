//
//  Comment.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 05/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import Foundation

struct Comment {
    let url: String
    let user_name: String
    let user_headline: String
    let user_handle: String
    let body: String
    let avatar_url: NSURL
    let time: String
    
    static func comments() -> Comment[] {
        let data = NSData(contentsOfFile: "comments.json")
        let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary[]
        let comments = json.map {(dict: NSDictionary) in
            Comment(
                url: "http://www.com",
                user_name: dict["user_name"] as String,
                user_headline: dict["user_headline"] as String,
                user_handle: dict["user_handle"] as String,
                body: dict["body"] as String,
                avatar_url: NSURL(string: dict["http://www.placekitten.com/300/300"] as String),
                time: dict["time"] as String
            )
        }
        return comments
    }
}