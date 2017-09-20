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
	
	private var description = ""
	private var location:String?
	private var latitude:Double?
	private var longitude:Double?
	private var fullTime = true
	private var page = 1
	
	private init() { }
	
	func getJobs(description:String, location:String, fullTime:Bool, completion:Completion) {
		guard self.description != description,
			let loc = self.location,
			loc != location,
			self.fullTime != fullTime else {
			return
		}
		self.description = description
		self.location = location
		self.fullTime = fullTime
		self.longitude = nil
		self.latitude = nil
		self.page = 1
		let params:[String:Any] = ["description": description,
		                           "location": location,
		                           "full_time": fullTime]
		jobData(params: params, completion: completion)
	}
	
	func getJobs(description:String, lat:Double, long:Double, fullTime:Bool, completion:Completion) {
		guard self.description != description,
			let _lat = self.latitude,
			_lat != lat,
			let _long = self.longitude,
			_long != long,
			self.fullTime != fullTime else {
			return
		}
			
		self.description = description
		self.latitude = lat
		self.longitude = long
		self.fullTime = fullTime
		self.location = nil
		self.page = 1
		let params:[String:Any] = ["description": description,
		                           "lat": lat,
		                           "long": long,
		                           "full_time": fullTime]
		jobData(params: params, completion: completion)
	}
	
	func nextPage(completion:Completion) {
		page += 1
		guard let loc = location else {
			guard let lat = latitude, let long = longitude else {
				return
			}
			let params:[String:Any] = ["description": description,
			                           "lat": lat,
			                           "long": long,
			                           "full_time": fullTime,
			                           "page":page]
			jobData(params: params, completion: completion)
			return
			
		}
		let params:[String:Any] = ["description": description,
		                           "location": loc,
		                           "full_time": fullTime,
		                           "page":page]
		jobData(params: params, completion: completion)
	}
	
	private func jobData(params:[String:Any], completion:Completion) {
		Api.instance.getJobs(params: params, completion: completion)
	}
}
