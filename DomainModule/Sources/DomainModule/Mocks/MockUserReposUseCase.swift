//
//  MockUserReposUseCase.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct MockUserReposUseCase: UserReposUseCaseProtocol {
    public init() {}
    public func getUserRepos() async throws -> [UserRepoEntity] {
        return [
            .init(
                id: 22,
                name: "Mock User Repo",
                fullName: "Mock Full Name",
                openIssues: 2,
                watchersCount: 22,
                forksCount: 121,
                owner: .init(avatarUrl: "https://mockImage.com")
            )
        ]
    }
    
    public func getRepoDetails(repoName: String) async throws -> UserRepoEntity {
        .init(
            id: 1,
            name: "Mock User Repo",
            fullName: "Mock Full Name",
            openIssues: 2,
            watchersCount: 22,
            forksCount: 212,
            owner: .init(avatarUrl: "https://mockImage.com")
        )
    }
    
    public func getRepoTags(repoName: String) async throws -> [RepoTagsEntity] {
        return [.init(name: "Mock Tag", commit: .init(sha: "2121wx21321"))]
    }
}
