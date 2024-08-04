//
//  UserReposEntity+Mapping.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation
import DomainModule
import NetworkingModule

extension UserRepoEntityDTO {
    func toUserReposEntity() -> UserRepoEntity {
        return .init(
            id: id,
            name: name,
            fullName: fullName,
            openIssues: openIssues,
            watchersCount: watchersCount,
            forksCount: forksCount,
            owner: owner.toOwnerEntity()
        )
    }
}

extension Array where Element == UserRepoEntityDTO {
    func toUserReposEntity() -> [UserRepoEntity] {
        return self.map { $0.toUserReposEntity() }
    }
}
