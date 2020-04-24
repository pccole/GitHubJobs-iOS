//
//  URLValue.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

@propertyWrapper
public struct URLValue: Codable {
    private let value: String
    public var wrappedValue: URL
    
    public init(wrappedValue: URL) {
        self.wrappedValue = wrappedValue
        value = wrappedValue.absoluteString
    }
    
    public init(from decoder: Decoder) throws {
        value = try String(from: decoder)
        guard let url = URL(string: value) else {
            throw NSError(domain: "\(Bundle.main)", code: 0, userInfo: ["error": "Could not convert string to URL"])
        }
        wrappedValue = url
    }
}
