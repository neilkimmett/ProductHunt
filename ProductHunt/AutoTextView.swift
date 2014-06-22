//
//  AutoTextView.swift
//  ProductHunt
//
//  Created by Neil Kimmett on 22/06/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

import UIKit

class AutoTextView: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.bounds.size != self.intrinsicContentSize() {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        var intrinsicContentSize = self.contentSize
        intrinsicContentSize.width += (self.textContainerInset.left + self.textContainerInset.right) / 2.0
        intrinsicContentSize.height += (self.textContainerInset.top + self.textContainerInset.bottom) / 2.0
        return intrinsicContentSize
    }
}