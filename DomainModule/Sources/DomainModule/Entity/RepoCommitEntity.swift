//
//  RepoCommitEntity.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct RepoCommitEntity: Equatable {
    public let sha: String
    
    public init(sha: String) {
        self.sha = sha
    }
}
