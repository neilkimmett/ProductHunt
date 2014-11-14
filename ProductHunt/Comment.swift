//
//  Comment.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 05/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit
import MarksmanFramework

struct Comment {
    let index: Integer
    let comment: String
    let comment_html: String
    let user: User
    let timestamp: String
    
    var attributedComment: NSAttributedString {
        let font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        let attrComment = NSMutableAttributedString(string: self.comment, attributes:[NSFontAttributeName : font])
        let string: NSString = self.comment
        let regex = NSRegularExpression(pattern: "@(\\w+)", options: NSRegularExpressionOptions(), error: nil)
        let range = NSMakeRange(0, self.comment.utf16count)
        let matches = regex.matchesInString(self.comment, options: NSMatchingOptions(), range: range) as NSTextCheckingResult[]
        for match in matches {
            attrComment.addAttribute(NSForegroundColorAttributeName, value: UIColor(r: 218.0, g: 85.0, b: 47.0), range: match.range)
        }
        return attrComment
    }
}