//
//  UserReposUseCase.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public protocol UserReposUseCaseProtocol {
    func getUserRepos() async throws -> [UserRepoEntity]
    func getRepoDetails(repoName: String) async throws -> UserRepoEntity
    func getRepoTags(repoName: String) async throws -> [RepoTagsEntity]
}

public struct UserReposUseCase<T: UserReposRepositoryProtocol>: UserReposUseCaseProtocol {
    private let repo: T
    
    public init(repo: T) {
        self.repo = repo
    }
    
    public func getUserRepos() async throws -> [UserRepoEntity] {
        return try await repo.getUserRepos()
    }
    
    public func getRepoDetails(repoName: String) async throws -> UserRepoEntity {
        return try await repo.getRepoDetails(repoName: repoName)
    }
    
    public func getRepoTags(repoName: String) async throws -> [RepoTagsEntity] {
        return try await repo.getRepoTags(repoName: repoName)
    }
}
