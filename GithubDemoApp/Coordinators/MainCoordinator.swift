//
//  MainCoordinator.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 2.8.24..
//

import UIKit

final class MainCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    func begin() {
        showUserReposScreen()
    }
    
    public init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    private func showUserReposScreen() {
        let userReposVC = UserReposScreen(
            viewModel: .init(
                openDetailsScreen: { repoName in
                    self.showUserRepoDetails(repoName: repoName)
                },
                userReposUseCase: Dependencies().userReposUseCase
            )
        ).hosted
        
        pushViewController(userReposVC)
    }
    
    private func showUserRepoDetails(repoName: String) {
        let repoDetailsVC = RepoDetailsScreen(
            viewModel: .init(
                repoName: repoName, 
                repoDetailsUseCase: Dependencies().userReposUseCase,
                onDismiss: {
                    self.navigationController.popViewController(animated: true)
                }
            )
        ).hosted
        
        pushViewController(repoDetailsVC)
    }
}
