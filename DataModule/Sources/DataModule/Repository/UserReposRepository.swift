//
//  UserReposRepository.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation
import DomainModule
import NetworkingModule

public struct UserReposRepository: UserReposRepositoryProtocol {
    public static var newRepo: UserReposRepository {
        UserReposRepository(service: NetworkingService.shared)
    }
    
    private let service: NetworkingService
    
    init(service: NetworkingService) {
        self.service = service
    }
    
    public func getUserRepos() async throws -> [UserRepoEntity] {
        guard let request = UserReposAPIRequest().generateURLRequest() else { throw APIError.notFound }
        
        let userRepos: [UserRepoEntityDTO] = try await service.send(request)
        return userRepos.toUserReposEntity()
    }
    
    public func getRepoDetails(repoName: String) async throws -> UserRepoEntity {
        guard let request = RepoDetailsAPIRequest(repoName: repoName).generateURLRequest() else { throw APIError.notFound }
        
        let repoDetails: UserRepoEntityDTO = try await service.send(request)
        return repoDetails.toUserReposEntity()
    }
    
    public func getRepoTags(repoName: String) async throws -> [RepoTagsEntity] {
        guard let request = RepoTagsAPIRequest(repoName: repoName).generateURLRequest() else { throw APIError.notFound }
        
        let repoTags: [RepoTagsEntityDTO] = try await service.send(request)
        return repoTags.toRepoTagsEntity()
    }
}
