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
    
    var attributedString: NSAttributedString
    
    var label: UILabel {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.attributedText = attributedString
        return l
    }
    
    var view: UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.addSubview(self.label)
        self.label.pinToSuperview()
        return v
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.attributedText = attributedString
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.isEditable = false
        uiView.font = UIFont.systemFont(ofSize: 16)
        
        uiView.heightAnchor.constraint(equalToConstant: uiView.contentSize.height).isActive = true
    }
    
}

