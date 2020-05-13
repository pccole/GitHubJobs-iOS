//
//  File.swift
//  GitHubJobs
//
//  Created by Phil Cole on 5/13/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import SwiftUI

extension UINavigationBarAppearance {
    static let defaultAppearance = _default
        
    static private var _default: UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.black
        return navBarAppearance
    }
}
