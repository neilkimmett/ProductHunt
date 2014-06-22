//
//  Comment.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 05/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

struct Comment {
    let index: Integer
    let comment: String
    let comment_html: String
    let user: User
    let timestamp: String
    
    var attributedComment: NSAttributedString {
        let attrComment = NSMutableAttributedString(string: self.comment)
        let string: NSString = self.comment
        let regex = NSRegularExpression(pattern: "@(\\w+)", options: NSRegularExpressionOptions(), error: nil)
        let range = NSMakeRange(0, self.comment.utf16count)
        let matches = regex.matchesInString(self.comment, options: NSMatchingOptions(), range: range) as NSTextCheckingResult[]
        for match in matches {
            attrComment.addAttribute(NSForegroundColorAttributeName, value: UIColor.huntColor(), range: match.range)
        }
        return attrComment
    }
}