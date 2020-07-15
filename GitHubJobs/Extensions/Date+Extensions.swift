//
//  Date+Extensions.swift
//  GitHubJobs
//
//  Created by Phil Cole on 7/13/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

extension Date {
    static var githubFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "EEE MMM d HH:mm:ss Z yyyy"
        return df
    }
}
