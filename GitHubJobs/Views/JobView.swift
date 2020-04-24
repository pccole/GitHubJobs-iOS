//
//  JobView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import SwiftUI

struct JobView: View {
    
    let job: GithubJob
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(job.title)
            Text(job.company)
            Text(job.location)
        }
    }
}

struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [GithubJob] = PreviewData.load()
        return Group {
            ForEach(data) { (job: GithubJob) in
                JobView(job: job)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
