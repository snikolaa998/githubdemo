//
//  RepoTagsAPIRequest.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct RepoTagsAPIRequest: GitHubGetAPIRequest {
    public typealias ResponseType = [RepoTagsEntityDTO]
    
    public var endpoint: String { "/repos/octocat/\(repoName)/tags" }
    
    private let repoName: String
    
    public init(repoName: String) {
        self.repoName = repoName
    }
}
