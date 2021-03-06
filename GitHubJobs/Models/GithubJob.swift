//
//  GithubJob.swift
//  GitHubJobs
//
//  Created by Phil Cole on 4/22/20.
//  Copyright © 2020 Cole LLC. All rights reserved.
//

import Foundation
import CoreData

public final class GithubJob: NSManagedObject, Decodable {
    @NSManaged public var company: String
    @NSManaged public var companyLogoString: String?
    @NSManaged public var jobDescription: String
    @NSManaged public var jobURLString: String
    @NSManaged public var title: String
    @NSManaged public var companyURLString: String?
    @NSManaged public var createdAt: String
    @NSManaged public var howToApply: String
    @NSManaged public var id: String
    @NSManaged public var location: String
    @NSManaged public var type: String
    
//    @URLValue var url: URL
//    @OptionalURLValue var companyLogoURL: URL?
//    @OptionalURLValue var companyURL: URL?

    var url: URL {
        return URL(string: jobURLString)!
    }
    
    var companyLogoURL: URL? {
        return URL(string: companyLogoString ?? "")
    }
    
    var companyURL: URL? {
        return URL(string: companyURLString ?? "")
    }
    
    var createdAtDate: Date {
        return Date.githubFormatter.date(from: createdAt) ?? Date()
    }
    
    public enum CodingKeys: String, CodingKey {
        case company
        case url
        case company_logo
        case company_url
        case created_at
        case description
        case how_to_apply
        case id
        case title
        case type
        case location
    }
    
    public required init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.managedObjectContext else {
            fatalError("decode failure")
        }
        guard let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext else {
            fatalError("decode failure")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "GithubJob", in: managedObjectContext) else {
            fatalError("decode failure")            
        }
        
        super.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        company = try values.decode(String.self, forKey: .company)
        jobURLString = try values.decode(String.self, forKey: .url)
        companyLogoString = try values.decodeIfPresent(String.self, forKey: .company_logo)
        companyURLString = try values.decodeIfPresent(String.self, forKey: .company_url)
        createdAt = try values.decode(String.self, forKey: .created_at)
        jobDescription = try values.decode(String.self, forKey: .description)
        howToApply = try values.decode(String.self, forKey: .how_to_apply)
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        type = try values.decode(String.self, forKey: .type)
        location = try values.decode(String.self, forKey: .location)

    }
}

extension GithubJob {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GithubJob> {
        return NSFetchRequest<GithubJob>(entityName: "GithubJob")
    }
}

extension GithubJob: Identifiable { }

extension GithubJob {
    var createdAtDescription: String {
        let timeInterval = Date().timeIntervalSince(createdAtDate)
        let days = timeInterval / 86400
        return String(format: "%.0f day\(days > 1 ? "s" : "") ago", days)
    }
}

