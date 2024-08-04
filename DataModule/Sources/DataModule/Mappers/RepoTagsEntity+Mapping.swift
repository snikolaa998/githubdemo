//
//  RepoTagsEntity+Mapping.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation
import DomainModule
import NetworkingModule

extension RepoTagsEntityDTO {
    func toRepoTagEntity() -> RepoTagsEntity {
        return .init(
            name: name,
            commit: commit.toRepoCommitEntity()
        )
    }
}

extension Array where Element == RepoTagsEntityDTO {
    func toRepoTagsEntity() -> [RepoTagsEntity] {
        return self.map { $0.toRepoTagEntity() }
    }
}
