//
//  Search.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/21/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation

struct JobSearch {
	let description:String
	let location:String?
	let latitude:Double?
	let longitude:Double?
	let fullTime = true
	
	var parameters: [String: Any]? {
		if let location = location {
			let parameters:[String:Any] = ["location":location,
			                  "description":description,
			                  "full_time":fullTime]
			return parameters
		} else if let latitude = latitude, let longitude = longitude {
			let parameters:[String:Any] = ["latitude":latitude,
			                               "longitude":longitude,
			                               "description":description,
			                               "full_time":fullTime]
			return parameters
		} else {
			return nil
		}
	}
	
}
