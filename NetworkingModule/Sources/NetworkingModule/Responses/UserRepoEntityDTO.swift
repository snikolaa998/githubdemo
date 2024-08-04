//
//  UserReposEntityDTO.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct UserRepoEntityDTO: Decodable {
    public let id: Int
    public let name: String
    public let fullName: String
    public let openIssues: Int
    public let watchersCount: Int
    public let forksCount: Int
    public let owner: OwnerEntityDTO
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case openIssues = "open_issues"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
    }
}
