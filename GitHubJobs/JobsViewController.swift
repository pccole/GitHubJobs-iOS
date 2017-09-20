//
//  JobsViewController.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/19/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit

class JobsViewController: UIViewController {

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
		title = "Jobs"
		view.addSubview(tableview)
		view.sendSubview(toBack: tableview)
		NSLayoutConstraint.activate(tableViewConstraints)
		view.addSubview(spinner)
		NSLayoutConstraint.activate(spinnerConstraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
