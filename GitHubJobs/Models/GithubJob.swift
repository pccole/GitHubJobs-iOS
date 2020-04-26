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
    var attributedHTMLDescription: NSAttributedString {
        guard let data = description.data(using: .unicode) else { return NSAttributedString() }
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
        let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil)
        guard let string = attributedString else { return NSAttributedString() }
        return string
    }
}
