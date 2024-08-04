//
//  UserReposRepositoryProtocol.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public protocol UserReposRepositoryProtocol: RepositoryProtocol {
    func getUserRepos() async throws -> [UserRepoEntity]
    func getRepoDetails(repoName: String) async throws -> UserRepoEntity
    func getRepoTags(repoName: String) async throws -> [RepoTagsEntity]
}
