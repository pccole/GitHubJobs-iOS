//
//  GithubJob.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

public struct GithubJob: Codable {
    public let id: String
    public let type: String
    @URLValue public var url: URL
    @DateValue var createdAt: Date
    public let company: String
    @OptionalURLValue public var companyUrl: URL?
    let location: String
    let title: String
    let description: String
    let howToApply: String
    @OptionalURLValue public var companyLogo: URL?
}

extension GithubJob: Identifiable { }

extension GithubJob {
    var createdAtDescription: String {
        let timeInterval = Date().timeIntervalSince(createdAt)
        let days = timeInterval / 86400
        return String(format: "%.0f day\(days > 1 ? "s" : "") ago", days)
    }
}

