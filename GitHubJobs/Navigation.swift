//
//  Navigation.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/17/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit

class Navigation {
	
	let instance = Navigation()
	
	private lazy var nav: UINavigationController = {
		let controller = UINavigationController(rootViewController: SearchViewController())
		return controller
	}()
	
	private init() { }
	
}
