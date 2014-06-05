//
//  Item.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 04/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import Foundation

class Item {
    let url : String
    let title : String
    let subtitle : String
    let avatar_url: NSURL
    init(url: String, title : String, subtitle : String, avatar_url: String) {
        self.url = url
        self.title = title
        self.subtitle = subtitle
        self.avatar_url = NSURL(string: avatar_url)
    }
}