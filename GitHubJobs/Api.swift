//
//  Api.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/17/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation
import Alamofire

typealias Completion = (([[String:Any]]) -> Void)?

class Api {
	static let instance = Api()
	
	private let baseUrl: String = {
		return "https://jobs.github.com/positions.json"
	}()
	
	private init() { }
	
	func getJobs(description:String, location:String, fullTime:Bool, completion:Completion) {
		let params:[String:Any] = ["description": description,
		                           "location": location,
		                           "full_time": fullTime]
		getJobs(params: params, completion: completion)
	}
	
	func getJobs(description:String, lat:Double, long:Double, fullTime:Bool, completion:Completion) {
		let params:[String:Any] = ["description": description,
		                           "lat": lat,
		                           "long": long,
		                           "full_time": fullTime]
		getJobs(params: params, completion: completion)
	}
	
	private func getJobs(params:[String:Any], completion:Completion) {
		Alamofire.request(baseUrl, parameters: params).responseJSON { (dataResponse:DataResponse<Any>) in
			guard dataResponse.result.isSuccess else {
				return
			}
			
		}
	}
}
