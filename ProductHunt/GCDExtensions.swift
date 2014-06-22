//
//  GCDExtensions.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 22/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import Foundation

func dispatch_main_queue(block: dispatch_block_t?) {
    dispatch_async(dispatch_get_main_queue(), block)
}