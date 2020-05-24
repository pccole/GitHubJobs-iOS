//
//  SearchParameters.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/24/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation


class SearchParameters: Encodable, ObservableObject {
    var page = 1
    var description: String = ""
    var location: String = ""
    
    
    func queryItems() -> [URLQueryItem] {
        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            encoder.dateEncodingStrategy = .iso8601
            let data = try encoder.encode(self)
            guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return []
            }
            var items = [URLQueryItem]()
            for dict in json {
                items.append(URLQueryItem(name: dict.key, value: "\(dict.value)"))
            }
            return items
        } catch {
            print(error)
            return []
        }
    }
}
