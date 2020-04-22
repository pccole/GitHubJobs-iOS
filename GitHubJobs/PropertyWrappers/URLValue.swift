//
//  URLValue.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

@propertyWrapper
struct URLValue: Codable {
    private let value: String
    var wrappedValue: URL
    
    init(wrappedValue: URL) {
        self.wrappedValue = wrappedValue
        value = wrappedValue.absoluteString
    }
    
    init(from decoder: Decoder) throws {
        value = try String(from: decoder)
        guard let url = URL(string: value) else {
            throw NSError(domain: "\(Bundle.main)", code: 0, userInfo: ["error": "Could not convert string to URL"])
        }
        wrappedValue = url
    }
}
