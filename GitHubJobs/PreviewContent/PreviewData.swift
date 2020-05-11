//
//  PreviewData.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

public struct PreviewData {
    public static func load() -> [GithubJob] {
        let data: Data
        let filename = "Jobs.json"
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let json = try decoder.decode([GithubJob].self, from: data)
//            print(json)
            return json
        } catch {
            fatalError("Couldn't parse \(filename) as \([GithubJob].self):\n\(error)")
        }
    }
}
