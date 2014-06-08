//
//  UIColorExtensions.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 05/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: Float, g: Float, b: Float, a: Float = 1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}