//
//  UIViewExtensions.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/25/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func pinToSuperview() {
        guard let sv = superview else { return }
        sv.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sv.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sv.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
