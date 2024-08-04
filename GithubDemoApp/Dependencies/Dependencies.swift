//
//  Dependencies.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation
import DomainModule
import DataModule

class Dependencies {
    private static var instancesCount = 0
    init() {
        Dependencies.instancesCount += 1
    }
    
    lazy var userReposUseCase: UserReposUseCase = {
        UserReposUseCase(repo: UserReposRepository.newRepo)
    }()
}
