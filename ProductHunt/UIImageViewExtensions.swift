//
//  UIImageViewExtensions.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 22/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

var imageCache = Dictionary<String, UIImage>()

extension UIImageView {
    func loadImageFromURL(urlString: String) {
        if let image = imageCache[urlString] {
            self.image = image
        }
        else {
            self.image = UIImage(named: "avatar-placeholder")
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: config)
            let task = session.dataTaskWithURL(NSURL(string: urlString)) { (data, response, error) in
                let image = UIImage(data: data)
                dispatch_main_queue {
                    self.image = image
                    self.setNeedsDisplay()
                }
                imageCache[urlString] = image
            }
            task.resume()
        }
    }
}
