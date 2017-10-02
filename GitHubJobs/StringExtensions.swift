//
//  StringExtensions.swift
//  GitHubJobs
//
//  Created by Phil Cole on 10/1/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation

extension String {
	var attributedString:NSAttributedString? {
		guard let data = self.data(using: String.Encoding.utf8, allowLossyConversion: true) else {
			return nil
		}
		do {
			let string = try NSAttributedString(data: data,
			                                 options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
			                                           NSAttributedString.DocumentReadingOptionKey.characterEncoding:String.Encoding.utf8],
			                                 documentAttributes: nil)
			let string = try NSAttributedString(data: <#T##Data#>, options: <#T##[NSAttributedString.DocumentReadingOptionKey : Any]#>, documentAttributes: <#T##AutoreleasingUnsafeMutablePointer<NSDictionary?>?#>)
			return string
		} catch {
			print(error)
		}
		return nil
	}
}
