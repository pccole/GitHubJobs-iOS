//
//  Job.swift
//  GitHubJobs
//
//  Created by Phil Cole on 9/17/17.
//  Copyright © 2017 Phil Cole. All rights reserved.
//

import Foundation


struct Job: Codable {
	let id:String
	let created_at:String
	let title:String
	let location:String
	let type:String
	let description:String
	let how_to_apply:String
	let company:String
	let company_url:String?
	let company_logo:String?
	let url:String
	
	init() {
		id = ""
		created_at = ""
		title = ""
		location = ""
		type = ""
		description = ""
		how_to_apply = ""
		company = ""
		company_url = ""
		company_logo = ""
		url = ""
	}
}
