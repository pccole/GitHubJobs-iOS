//
//  JobView.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import SwiftUI

struct JobCellView: View {
    
    let job: GithubJob
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(job.title)
                .font(Font(FontStyle.headline.font!))
            Text(job.company)
                .font(Font(FontStyle.subhead.font!))
            Text(job.location)
                .font(Font(FontStyle.footnote.font!))
            HStack {
                Image(systemName: "clock")
                Text("\(job.createdAt)")
                    .font(Font(FontStyle.footnote.font!))
                Image(systemName: "briefcase")
                Text(job.type)
                    .font(Font(FontStyle.footnote.font!))
            }
        }
    .padding()
    }
}

struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [GithubJob] = PreviewData.load()
        return Group {
            ForEach(data) { (job: GithubJob) in
                JobCellView(job: job)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
