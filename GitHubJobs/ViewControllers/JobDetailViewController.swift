//
//  JobDetailViewController.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/29/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import UIKit

class JobDetailViewController: UIViewController {

    private let job: GithubJob
    
    private lazy var descriptionTextView: UITextView = {
        return newTextView()
    }()
    
    private lazy var howToApplyTextView: UITextView = {
        return newTextView()
    }()
    
    private func newTextView() -> UITextView {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEditable = false
        view.isScrollEnabled = false
        view.font = FontStyle.body.font
        return view
    }
    
    private lazy var scollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var companyHeaderLabel: UILabel = {
       return newHeaderLabel()
    }()
    
    private lazy var applyHeaderLabel: UILabel = {
        let label = newHeaderLabel()
        label.text = "How to Apply"
        return label
    }()
    
    private func newHeaderLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = FontStyle.title1.font
        label.numberOfLines = 0
        return label
    }
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.companyHeaderLabel, self.descriptionTextView, self.applyHeaderLabel, self.howToApplyTextView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    init(job: GithubJob) {
        self.job = job
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.setHTML(text: job.description)
        howToApplyTextView.setHTML(text: job.howToApply)
        
        companyHeaderLabel.text = job.company
        
        addSubviews()
        applyConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(scollView)
        scollView.addSubview(vStack)
    }
    
    private func applyConstraints() {
        scollView.pinToSuperview()
        
        vStack.topAnchor.constraint(equalTo: scollView.topAnchor).isActive = true
        vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        vStack.bottomAnchor.constraint(equalTo: scollView.bottomAnchor).isActive = true
    }
}
