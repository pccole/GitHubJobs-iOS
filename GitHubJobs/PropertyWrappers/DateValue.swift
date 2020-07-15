//
//  DateValue.swift
//  GitHubJobs
//
//  Created by Phil Cole on 5/4/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

public protocol DateValueCodableStrategy {
    associatedtype RawValue: Codable

    static func decode(_ value: RawValue) throws -> Date
    static func encode(_ date: Date) -> RawValue
}

@propertyWrapper
public struct DateValue: Codable {
    private var value: String
    public var wrappedValue: Date
    
    private static var formatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "EEE MMM d HH:mm:ss Z yyyy"
        return df
    }
    
    public init(wrappedValue: Date) {
        self.wrappedValue = wrappedValue
        self.value = DateValue.formatter.string(from: wrappedValue)
    }
    
    public init(from decoder: Decoder) throws {
        self.value = try String(from: decoder)
        guard let date = DateValue.formatter.date(from: self.value) else {
            throw DecodingError.dataCorrupted(DecodingError.Context.init(codingPath: decoder.codingPath, debugDescription: "Invalid Date Format"))
        }
        self.wrappedValue = date
    }
}
