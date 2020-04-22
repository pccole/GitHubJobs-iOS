//
//  GithubJob.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

struct GithubJob: Codable {
    let id: String
    let type: String
    @URLValue var url: URL
    let createdAt: String
    let company: String
    @URLValue var companyURL: URL
    let location: String
    let title: String
    let description: String
    let howToApply: String
    let companyLogo: String
}
