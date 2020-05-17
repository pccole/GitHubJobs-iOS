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
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .center) {
                    Text(job.title)
                    .font(Font(FontStyle.headline.font!))
                    Spacer()
                    if job.isBookmark == true {
                        Image(systemName: "bookmark.fill").imageScale(.medium)
                    } else {
                        Image(systemName: "bookmark").imageScale(.medium)
                        
                    }
                }
                Text(job.company)
                    .font(Font(FontStyle.subhead.font!))
                Text(job.location)
                    .font(Font(FontStyle.footnote.font!))
                HStack(spacing: 15) {
                    HStack(spacing: 5) {
                        Image(uiImage: UIImage(systemName: "clock", withConfiguration: UIImage.SymbolConfiguration(textStyle: .footnote))!)
                        Text("\(job.createdAtDescription)")
                            .font(Font(FontStyle.footnote.font!))
                    }
                    HStack(spacing: 5) {
                        Image(uiImage: UIImage(systemName: "briefcase", withConfiguration: UIImage.SymbolConfiguration(textStyle: .footnote))!)
                        Text(job.type)
                            .font(Font(FontStyle.footnote.font!))
                    }
                }
            }
            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "Disclosure"))
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
