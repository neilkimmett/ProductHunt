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
        self.init(r: r/255.0, g: g/255.0, b: b/255.0, a: a)
    }
    class func huntColor() -> UIColor {
        return UIColor(r: 218.0, g: 85.0, b: 47.0)
    }
}