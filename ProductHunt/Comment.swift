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
        let robin = [
            "user_name": "Robin Bilgil",
            "user_headline": "Co-Founder at Parsly UK",
            "user_handle": "@RBilgil",
            "time": "16h ago",
            "body": "Seems like itd be really useful for when hiring. A little indication about what to search for would be nice, I had no idea what I was supposed to type in the box at first!",
        ]
        let ryan = [
            "user_name": "Ryan Hoover",
            "user_headline": "Product Hunt",
            "user_handle": "@rrhoover",
            "time": "16h ago",
            "body": "RBilgil - check out @maccaws Sourcing.io. Its basically a search engine for engineering talent."
        ]
        let jack = [
            "user_name": "Jack Smith",
            "user_headline": "Co-Founded @vungle & @shyp",
            "user_handle": "@_jacksmith",
            "time": "16h ago",
            "body": "talking about recruiting; I think that http://www.3sourcing.com is actually another product of theirs, built using their same API."
        ]
        let nick = [
            "user_name": "Nicholas L. Holland",
            "user_headline": "CEO, Populr.me",
            "user_handle": "@nicholasholland",
            "time": "11h ago",
            "body": "Think beyond hiring - this is great for investors (they search Angel list) and also SALES!"
        ]
        let json = [robin, ryan, jack, nick]

        let comments = json.map {
            Comment(
                url: "http://www.com",
                user_name: $0["user_name"]!,
                user_headline: $0["user_headline"]!,
                user_handle: $0["user_handle"]!,
                body: $0["body"]!,
                avatar_url: NSURL(string: "http://www.placekitten.com/300/300"),
                time: $0["time"]!
            )
        }
        return comments
    }
}