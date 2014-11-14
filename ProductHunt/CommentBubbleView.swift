//
//  CommentBubbleView.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 24/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

class CommentBubbleView: UIButton {
    var bubbleLabel: UILabel {
        let label = UILabel()
        label.font = UIFont(name: "FontAwesome", size: 20)
        label.text = ""
        label.textAlignment = .Center
        label.textColor = UIColor.huntColor()
        return label
    }
    var textLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(16)
        label.textColor = UIColor.whiteColor()
        return label
    }
    let numberLabel = UILabel()
    init(frame: CGRect)  {
        super.init(frame: frame)
        self.addSubview(self.bubbleLabel)
        self.addSubview(self.textLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bubbleLabel.frame = self.bounds
        self.textLabel.frame = self.bounds
    }
}
