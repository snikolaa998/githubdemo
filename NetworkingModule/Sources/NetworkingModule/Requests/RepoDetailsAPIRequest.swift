//
//  RepoDetailsAPIRequest.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct RepoDetailsAPIRequest: GitHubGetAPIRequest {
    public typealias ResponseType = UserRepoEntityDTO
    
    public var endpoint: String { "/repos/octocat/\(repoName)" }
    
    private let repoName: String
    
    public init(repoName: String) {
        self.repoName = repoName
    }
}
