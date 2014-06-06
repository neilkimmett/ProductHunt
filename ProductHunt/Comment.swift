//
//  Comment.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 05/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import Foundation

class Comment {
    let url: String
    let user_name: String
    let user_headline: String
    let user_handle: String
    let body: String
    let avatar_url: NSURL
    init(url: String, user_name: String, user_headline: String, user_handle: String, body: String, avatar_url: String) {
        self.url = url
        self.user_name = user_name
        self.user_headline = user_headline
        self.user_handle = user_handle
        self.body = body
        self.avatar_url = NSURL(string: avatar_url)
    }
}