//
//  JSONDecoder+Extensions.swift
//  GitHubJobs
//
//  Created by Phil Cole on 5/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static var jobsDecoder: JSONDecoder {
        let decode = JSONDecoder()
        decode.keyDecodingStrategy = .convertFromSnakeCase
        return decode
    }
}
