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
	
	func getJobs(params:[String:Any], completion:Completion) {
		Alamofire.request(baseUrl, parameters: params).responseJSON { (dataResponse:DataResponse<Any>) in
			guard dataResponse.result.isSuccess else {
				return
			}
			
		}
	}
}
