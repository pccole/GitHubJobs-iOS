//
//  AttributedTextUIView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/28/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import UIKit

class HTMLAttributedTextView: UIView {

    private lazy var textView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    init(attributedString: NSAttributedString) {
        super.init(frame: .zero)
        addSubview(textView)
        textView.attributedText = attributedString
        textView.isScrollEnabled = false
        textView.isEditable = false
        translatesAutoresizingMaskIntoConstraints = false
        textView.sizeToFit()
    }
    
    private override init(frame: CGRect) {
        fatalError("init(frame:) not implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        topAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 0).isActive = true
        trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: 0).isActive = true
        bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        let width = widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width)
        width.priority = .defaultHigh
        width.isActive = true
//        textView.layoutIfNeeded()
    }
}
