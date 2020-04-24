//
//  NavigationConfigurator.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/23/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            configure(nc)
        } else {
            print("didn't work")
        }
    }
}
