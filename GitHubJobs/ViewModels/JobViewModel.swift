//
//  JobViewModel.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

extension Notification.Name {
    static var jobs: Notification.Name {
        return Notification.Name("jobs")
    }
    
}

class JobViewModel: ObservableObject {
    @Published var jobs: [GithubJob] = []
    @Published var error: Error = NSError(domain: "", code: 0, userInfo: nil)
    
    private var page = 1
    private var jobsPerPage = 50
    
    init() {
        getJobs()
    }
    
    func getJobs() {
        #if DEBUG
            loadLocalData()
        #else
            fetchData()
        #endif
    }
    
    private func loadLocalData() {
        jobs = PreviewData.load()
    }
    
    private func fetchData() {
        
    }
}

extension JobViewModel: RandomAccessCollection {
    typealias Element = GithubJob
    
    var startIndex: Int {
        return jobs.startIndex
    }
    
    var endIndex: Int {
        return jobs.endIndex
    }
    
    subscript(position: Int) -> GithubJob {
        if jobs.count >= jobsPerPage, jobs.distance(from: position, to: jobs.count) == 10 {
            page += 1
        }
        return jobs[position]
    }
}
