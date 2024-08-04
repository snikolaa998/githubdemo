//
//  RepoCommitEntity+Mapping.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation
import DomainModule
import NetworkingModule

extension RepoCommitEntityDTO {
    func toRepoCommitEntity() -> RepoCommitEntity {
        return .init(sha: sha)
    }
}
