//
//  JobDetailVCRepresentable.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/29/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import SwiftUI

struct JobDetailVCRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = JobDetailViewController
    
    let job: GithubJob
    
    func makeUIViewController(context: Context) -> JobDetailViewController {
        let vc = JobDetailViewController(job: job)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: JobDetailViewController, context: Context) {
        
    }
    
}
