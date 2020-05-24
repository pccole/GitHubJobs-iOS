//
//  JobViewModel.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import Combine

extension Notification.Name {
    static var jobs: Notification.Name {
        return Notification.Name("jobs")
    }
    
}

class JobViewModel: ObservableObject {
    @Published var jobs: [GithubJob] = []
    @Published var error: Error = NSError(domain: "", code: 0, userInfo: nil)
    var params = SearchParameters()
    
    private var jobsPerPage = 50
    
    var subscriber: AnyCancellable?
    
    init() {
        getJobs()   
    }
    
    func onAppear(job: GithubJob) {
        guard let position = jobs.firstIndex(where: { $0.id == job.id }),
            jobs.count >= jobsPerPage,
            jobs.distance(from: position, to: jobs.count) == 10 else { return }
            params.page += 1
            getJobs()
    }
    
    func getJobs() {
//        #if DEBUG
//            loadLocalData()
//        #else
            fetchData()
//        #endif
    }
    
    private func loadLocalData() {
        jobs = PreviewData.load()
    }
    
    private func fetchData() {
        let publisher = Network.shared.getJobs(paramaters: params, decode: [GithubJob].self)
        subscriber = publisher.sink(receiveCompletion: { (completion: Subscribers.Completion<Error>) in
            switch completion {
            case .failure(let error):
                print(error)
                self.error = error
            case .finished:
                break
            }
        }, receiveValue: { (jobs: [GithubJob]) in
            self.jobs.append(contentsOf: jobs)
        })
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
        return jobs[position]
    }
}
