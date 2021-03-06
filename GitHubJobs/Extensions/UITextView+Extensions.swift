//
//  UITextView+Extensions.swift
//  GitHubJobs
//
//  Created by Phil Cole on 5/3/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    /**
    - Sets HTML on a UITextView and appends the font-family (fontName) and font-size (pointSize) of the UITextView to the HTML.
     
    - parameters:
        - text: Html text in string format to display in the UITextView.
     */
    func setHTML(text: String) {
        let modifiedFont = "<span style=\"font-family: \(self.font!.fontName); font-size: \(self.font!.pointSize)\">\(text)</span>"
        modifiedFont.htmlAttributedString { (attrStr) in
            self.attributedText = attrStr
        }
    }
}
