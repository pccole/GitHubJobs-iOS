//
//  AttributedText.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/25/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct AttributedText: UIViewRepresentable {
    
    let string: String
    
    var textView: UITextView {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = false
        view.isEditable = false
        return view
    }
    
    func makeUIView(context: Context) -> UITextView {
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        string.htmlAttributedString { (attrString) in
            uiView.attributedText = attrString
            uiView.layoutIfNeeded()
        }
    }
    
}

