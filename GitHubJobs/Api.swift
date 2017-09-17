//
//  Api.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/17/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation
import Alamofire

class Api {
	static let instance = Api()
	
	private let baseUrl: String = {
		return "https://jobs.github.com/positions.json"
	}()
	
	private init() { }
	
	func getJobs(description:String, location:String, fullTime:Bool) {
		
	}
	
	func getJobs(description:String, lat:Double, long:Double, fullTime:Bool) {
		
	}
}
