//
//  RepoTagsEntity.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct RepoTagsEntity: Equatable {
    public let name: String
    public let commit: RepoCommitEntity
    
    public init(name: String, commit: RepoCommitEntity) {
        self.name = name
        self.commit = commit
    }
}
