//
//  GitJob+CoreDataProperties.swift
//  GitHubJobs
//
//  Created by Phil Cole on 6/10/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//
//

import Foundation
import CoreData


extension GitJob {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GitJob> {
        return NSFetchRequest<GitJob>(entityName: "GitJob")
    }

    @NSManaged public var id: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var company: String?
    @NSManaged public var companyUrl: String?
    @NSManaged public var type: String?
    @NSManaged public var title: String?
    @NSManaged public var location: String?
    @NSManaged public var url: String?
    @NSManaged public var jobDescription: String?
    @NSManaged public var howToApply: String?
    @NSManaged public var companyLogo: String?

}
