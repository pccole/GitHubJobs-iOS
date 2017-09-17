//
//  SearchViewController.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/17/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

	lazy var searchButton: UIBarButtonItem = {
		let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(searchTapped))
		return button
	}()
	
	lazy var clearButton: UIBarButtonItem = {
		let button = UIBarButtonItem(title: "Clear", style: UIBarButtonItemStyle.done, target: self, action: #selector(clearTapped))
		return button
	}()
	
	lazy var spinner: UIActivityIndicatorView = {
		let view = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var spinnerConstraints: [NSLayoutConstraint] = {
		return [
			self.view.centerXAnchor.constraint(equalTo: self.spinner.centerXAnchor),
			self.view.centerYAnchor.constraint(equalTo: self.spinner.centerYAnchor)
		]
	}()
	
	lazy var tableViewConstraints: [NSLayoutConstraint] = {
		return [
			self.tableview.topAnchor.constraint(equalTo: self.tableview.topAnchor),
			self.tableview.leadingAnchor.constraint(equalTo: self.tableview.leadingAnchor),
			self.tableview.trailingAnchor.constraint(equalTo: self.tableview.trailingAnchor),
			self.tableview.bottomAnchor.constraint(equalTo: self.tableview.bottomAnchor)
		]
	}()
	
	let tableview: UITableView = {
		let t = UITableView()
		t.translatesAutoresizingMaskIntoConstraints = false
		return t
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "GitHub Jobs"
		view.backgroundColor = UIColor.lightGray
		view.addSubview(tableview)
		view.sendSubview(toBack: tableview)
		NSLayoutConstraint.activate(tableViewConstraints)
		view.addSubview(spinner)
		NSLayoutConstraint.activate(spinnerConstraints)
		navigationController?.navigationItem.rightBarButtonItem = searchButton
    }
	
	@objc private func searchTapped() {
		view.bringSubview(toFront: tableview)
		view.bringSubview(toFront: spinner)
	}
	
	@objc private func clearTapped() {
		view.sendSubview(toBack: tableview)
	}
	
}
