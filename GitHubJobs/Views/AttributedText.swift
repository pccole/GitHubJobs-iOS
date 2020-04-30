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
    
    func makeUIView(context: Context) -> HTMLAttributedTextView {
        return HTMLAttributedTextView(attributedString: attributedString)
    }
    
    func updateUIView(_ uiView: HTMLAttributedTextView, context: Context) {
        uiView.layoutSubviews()
    }
    
}

