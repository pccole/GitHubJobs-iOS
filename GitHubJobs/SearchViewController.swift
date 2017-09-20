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
	

	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Search Jobs"
		view.backgroundColor = UIColor.lightGray
		navigationController?.navigationItem.rightBarButtonItem = searchButton
    }
	
	@objc private func searchTapped() {
		
	}
	
	@objc private func clearTapped() {
		
	}
	
}
