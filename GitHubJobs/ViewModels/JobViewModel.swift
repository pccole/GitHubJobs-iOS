//
//  JobViewModel.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

class JobViewModel: ObservableObject {
    @Published var jobs: [GithubJob] = []
    
    func getJobs() {
//        #if DEBUG
            loadLocalData()
//        #else
//            loadNetworkData()
//        #endif
    }
    
    private func loadLocalData() {
        jobs = PreviewData.load()
    }
    
    private func loadNetworkData() {
        
    }
}
