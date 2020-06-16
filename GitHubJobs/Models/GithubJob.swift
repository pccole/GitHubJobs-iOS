//
//  GithubJob.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

public struct GithubJob: Codable {
    let company: String
    @OptionalURLValue var companyLogo: URL?
    @OptionalURLValue var companyUrl: URL?
    @DateValue var createdAt: Date
    let description: String
    let howToApply: String
    public let id: String
    let location: String
    let title: String
    let type: String
    @URLValue var url: URL
    
    var isBookmark: Bool? = false
}

extension GithubJob: Identifiable { }

extension GithubJob {
    var createdAtDescription: String {
        let timeInterval = Date().timeIntervalSince(createdAt)
        let days = timeInterval / 86400
        return String(format: "%.0f day\(days > 1 ? "s" : "") ago", days)
    }
}

