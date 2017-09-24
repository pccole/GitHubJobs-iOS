//
//  JobsData.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/18/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation

class JobData {
	
	static let instance = JobData()
	
	private var searchData:JobSearch?
	private var page = 1
	private var data = [[String:Any]]()
	
	private init() { }
	
	func getJobs(data:JobSearch, completion:Completion) {
		searchData = data
		guard let params = data.parameters else {
			return
		}
		jobData(params: params, completion: completion)
	}
	
	func nextPage(completion:Completion) {
		page += 1
		guard var search = searchData?.parameters else {
			return
		}
		search["page"] = page
		jobData(params: search, completion: completion)
	}
	
	private func jobData(params:[String:Any], completion:Completion) {
		page = 1
		data.removeAll()
		Api.instance.getJobs(params: params) { (json:[[String : Any]]?) in
			guard let j = json else {
				completion?(nil)
				return
			}
			self.data.append(contentsOf: j)
			completion?(j)
		}
	}
}
