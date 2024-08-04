//
//  UserReposEntity.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct UserRepoEntity: Equatable {
    public let id: Int
    public let name: String
    public let fullName: String
    public let openIssues: Int
    public let watchersCount: Int
    public let forksCount: Int
    public let owner: OwnerEntity
    
    public init(
        id: Int,
        name: String,
        fullName: String,
        openIssues: Int,
        watchersCount: Int,
        forksCount: Int,
        owner: OwnerEntity
    ) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.openIssues = openIssues
        self.watchersCount = watchersCount
        self.forksCount = forksCount
        self.owner = owner
    }
}
