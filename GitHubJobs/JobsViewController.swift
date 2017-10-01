//
//  JobsViewController.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/19/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit

class JobsViewController: UIViewController {

	private var jobs:[Job]
	
	private lazy var spinner: UIActivityIndicatorView = {
		let view = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var spinnerConstraints: [NSLayoutConstraint] = {
		return [
			self.view.centerXAnchor.constraint(equalTo: self.spinner.centerXAnchor),
			self.view.centerYAnchor.constraint(equalTo: self.spinner.centerYAnchor)
		]
	}()
	
	private lazy var tableview: UITableView = {
		let t = UITableView()
		t.translatesAutoresizingMaskIntoConstraints = false
		t.register(JobTableViewCell.self, forCellReuseIdentifier: JobTableViewCell.description())
		t.delegate = self
		t.dataSource = self
		return t
	}()
	
	init(jobs:[Job]) {
		self.jobs = jobs
		super.init(nibName: nil, bundle: nil)
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		self.jobs = []
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Jobs"
		view.addSubview(tableview)
		view.sendSubview(toBack: tableview)
		tableview.pinToSuperview()
		view.addSubview(spinner)
		NSLayoutConstraint.activate(spinnerConstraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension JobsViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}

extension JobsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return jobs.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: JobTableViewCell.description(), for: indexPath) as! JobTableViewCell
		cell.job = jobs[indexPath.row]
		return cell
	}
}
