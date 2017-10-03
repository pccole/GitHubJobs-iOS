//
//  JobViewController.swift
//  GitHubJobs
//
//  Created by Phil Cole on 10/1/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit

class JobViewController: UIViewController {

	private let scrollView: UIScrollView = {
		let scroll = UIScrollView()
		scroll.translatesAutoresizingMaskIntoConstraints = false
		scroll.showsHorizontalScrollIndicator = false
		return scroll
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var locationLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var postedLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var descriptionTextView: UITextView = {
		let textView = UITextView()
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.isScrollEnabled = false
		return textView
	}()
	
	private lazy var stackView: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [titleLabel, locationLabel, postedLabel, descriptionTextView])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		return stack
	}()
	
	private lazy var stackViewConstraints: [NSLayoutConstraint] = {
		return [
			self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 15),
			self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 15),
			self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
			self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15)
		]
	}()
	
	private let job:Job
	
	init(job:Job) {
		self.job = job
		super.init(nibName: nil, bundle: nil)
	}
	
	private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		job = Job()
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubview(scrollView)
		scrollView.pinToSuperview()
		scrollView.addSubview(stackView)
		NSLayoutConstraint.activate(stackViewConstraints)
		titleLabel.text = job.title
		locationLabel.text = job.location
		postedLabel.text = job.created_at
		descriptionTextView.attributedText = job.description.attributedString
    }
}
