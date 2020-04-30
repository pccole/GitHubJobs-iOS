//
//  JobDetailView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/24/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import SwiftUI

struct JobDetailView: View {
    
    let job: GithubJob
    
    init(job: GithubJob) {
        self.job = job
    }
    
    var body: some View {
        JobDetailVCRepresentable(job: job)
    }
}

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let data = PreviewData.load()
        let first = data.first!
        return JobDetailView(job: first)
    }
}
