//
//  OptionalURLValue.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

@propertyWrapper
public struct OptionalURLValue: Codable {
    private let value: String?
    public var wrappedValue: URL?
    
    public init(wrappedValue: URL?) {
        self.wrappedValue = wrappedValue
        value = wrappedValue?.absoluteString
    }
    
    public init(from decoder: Decoder) throws {
        value = try String?(from: decoder)
        guard let string = value else { return }
        wrappedValue = URL(string: string)
    }
}
