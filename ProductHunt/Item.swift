//
//  Item.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 04/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import Foundation

struct Item {
    let url : String
    let permalink: String
    let comment_count : Int
    let rank : Int
    let votes : Int
    let title : String
    let tagline : String
    let user : User
}