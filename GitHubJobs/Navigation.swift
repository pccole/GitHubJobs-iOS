//
//  Navigation.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/17/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import UIKit

class Navigation {
	
	static let instance = Navigation()
	
	var view: UIViewController {
		return nav
	}
	
	private lazy var nav: UINavigationController = {
		let controller = UINavigationController(rootViewController: SearchViewController())
		controller.navigationBar.isTranslucent = false
		return controller
	}()
	
	private init() { }
	
	func present(_ controller:UIViewController, animated:Bool = true, completion:(() -> Void)? = nil) {
		nav.present(controller, animated: animated, completion: completion)
	}
	
	func push(_ controller:UIViewController, animated:Bool = true) {
		nav.pushViewController(controller, animated: animated)
	}
}
