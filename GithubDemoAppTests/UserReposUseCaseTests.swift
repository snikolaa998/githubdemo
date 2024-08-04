//
//  UserReposUseCaseTests.swift
//  GithubDemoAppTests
//
//  Created by Nikola Savic on 3.8.24..
//

import XCTest
import DomainModule
import DataModule

@testable import GithubDemoApp

final class UserReposUseCaseTests: XCTestCase {
    private var sut: UserReposUseCaseProtocol!
    
    override func setUp() {
        super.setUp()
        sut = MockUserReposUseCase()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchRepoDetailsSuccess() async {
        let response = try? await sut.getRepoDetails(repoName: "mockName")
        XCTAssertEqual(response?.name, "Mock User Repo")
    }
    
    func testFetchUserReposSuccess() async {
        let response = try? await sut.getUserRepos()
        XCTAssertEqual(response?[0].openIssues, 2)
    }
    
    func testFetchRepoTagsSuccess() async {
        let response = try? await sut.getRepoTags(repoName: "mockName")
        XCTAssertEqual(response?[0].commit.sha, "2121wx21321")
    }
}
