//
//  UIViewExtensions.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/17/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	func pinToSuperview() {
		guard let sv = superview else { return }
		translatesAutoresizingMaskIntoConstraints = false
		sv.topAnchor.constraint(equalTo: topAnchor).isActive = true
		sv.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		sv.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		sv.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
}
