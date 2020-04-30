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
    public let createdAt: String
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
  
}


