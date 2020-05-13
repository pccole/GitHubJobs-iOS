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
 
    private lazy var descriptionContainerView: UIView = {
        let v = newContainerView()
        v.addSubview(self.descriptionTextView)
        self.descriptionTextView.pinToSuperview()
        return v
    }()
    
    private lazy var howToApplyContainerView: UIView = {
        let v = newContainerView()
        v.addSubview(self.howToApplyTextView)
        self.howToApplyTextView.pinToSuperview()
        return v
    }()
    
    private func newContainerView() -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = false
        v.layer.shadowColor = UIColor.white.cgColor
        v.layer.shadowOpacity = 0.7
        v.layer.shadowRadius = 5.0
        v.layer.shadowOffset = CGSize(width: -5, height: -5)
        return v
    }
    
    private lazy var descriptionTextView: UITextView = {
        let textView = newTextView()
        textView.setHTML(text: self.job.description)
        return textView
    }()
    
    private lazy var howToApplyTextView: UITextView = {
        let textView = newTextView()
        textView.setHTML(text: job.howToApply)
        return textView
    }()
    
    private func newTextView() -> UITextView {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEditable = false
        view.isScrollEnabled = false
        view.font = FontStyle.callout.font
        view.clipsToBounds = false
        view.backgroundColor = UIColor.offWhite
        view.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        view.layer.cornerRadius = 25
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }
    
    private lazy var scollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var companyHeaderLabel: UILabel = {
        let label = newHeaderLabel()
        label.text = self.job.company
        return label
    }()
    
    private lazy var applyHeaderLabel: UILabel = {
        let label = newHeaderLabel()
        label.text = "How to Apply"
        return label
    }()
    
    private func newHeaderLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.numberOfLines = 0
        return label
    }
    
    private func spacerView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return view
    }
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.spacerView(), self.companyHeaderLabel, self.descriptionContainerView, self.spacerView(), self.applyHeaderLabel, self.howToApplyContainerView, self.spacerView()])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
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
        view.backgroundColor = UIColor.offWhite
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
