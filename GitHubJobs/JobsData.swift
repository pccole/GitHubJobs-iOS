//
//  JobsData.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/18/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation

typealias JobCompletion = (([Job]?) -> Void)?

class JobData {
	
	static let instance = JobData()
	
	private var searchData:JobSearch?
	private var page = 1
	private var jobs = [Job]()
	
	private init() { }
	
	func reset() {
		jobs.removeAll()
		page = 1
		searchData = nil
	}
	
	func getJobs(data:JobSearch, completion:JobCompletion) {
		searchData = data
		guard let params = data.parameters else {
			return
		}
		jobData(params: params, completion: completion)
	}
	
	func nextPage(completion:JobCompletion) {
		page += 1
		guard var search = searchData?.parameters else {
			return
		}
		search["page"] = page
		jobData(params: search, completion: completion)
	}
	
	private func jobData(params:[String:Any], completion:JobCompletion) {
		page = 1
		jobs.removeAll()
		Api.instance.getJobs(params: params) { (data:Data?) in
			guard let data = data else { return }
			do {
				let jobs = try JSONDecoder().decode([Job].self, from: data)
				self.jobs.append(contentsOf: jobs)
			} catch {
				print(error)
			}
			print(self.jobs)
			completion?(self.jobs)
		}
	}
}
