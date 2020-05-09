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
        view.isScrollEnabled = false
        view.isEditable = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(textView)
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
//        textView.layoutIfNeeded()
    }
}
