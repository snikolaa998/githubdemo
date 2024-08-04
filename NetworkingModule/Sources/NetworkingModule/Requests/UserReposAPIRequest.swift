//
//  UserReposAPIRequest.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct UserReposAPIRequest: GitHubGetAPIRequest {
    public typealias ResponseType = [UserRepoEntityDTO]
    
    public var endpoint: String { "/users/octocat/repos" }
    
    public init() {}
}
