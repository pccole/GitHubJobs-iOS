//
//  JobViewController.swift
//  GitHubJobs
//
//  Created by Phil Cole on 10/1/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit

class JobViewController: UIViewController {

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
    }
	
	
}
