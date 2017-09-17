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
		view.addSubview(tableview)
		view.sendSubview(toBack: tableview)
		NSLayoutConstraint.activate(tableViewConstraints)
		navigationController?.navigationItem.rightBarButtonItem = searchButton
		
    }
	
	@objc private func searchTapped() {
		view.bringSubview(toFront: tableview)
	}
	
	@objc private func clearTapped() {
		
	}
	
}
