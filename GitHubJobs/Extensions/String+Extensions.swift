//
//  StringExtensions.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/29/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation

extension String {
    /**
    -  NSAttributedString crashes when called from SwiftUI. Wrapping it in a async dispatch on the main thread resolves the crash.
     
     - parameters:
        - completion: NSAttributedString with documentType set to NSAttributedString.DocumentType.html.
     */
    func htmlAttributedString(_ completion: @escaping (NSAttributedString) -> Void) {
        DispatchQueue.main.async {
            guard let data = self.data(using: .unicode) else {
                completion(NSAttributedString())
                return
            }
            let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
            let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil)
            guard let attString = attributedString else {
                completion(NSAttributedString())
                return
            }
            completion(attString)
        }
    }
}
