//
//  UserReposViewModel.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation
import DomainModule

final class UserReposViewModel: ViewModel {
    struct State: Equatable {
        var userRepos: [UserRepoEntity] = []
        var isLoading = false
        var toast: Toast?
    }
    
    enum Action {
        case openRepoDetailsScreen(String)
        case fetchUserRepos
        case showingSpinner(Bool)
    }
    
    @Published var state = State()
    
    private let userReposUseCase: UserReposUseCaseProtocol
    private let openDetailsScreen: (String) -> ()
    
    init(openDetailsScreen: @escaping(String) -> Void, userReposUseCase: UserReposUseCaseProtocol) {
        self.userReposUseCase = userReposUseCase
        self.openDetailsScreen = openDetailsScreen
    }
    
    func dispatch(_ action: Action) {
        switch action {
        case .openRepoDetailsScreen(let repoName):
            openDetailsScreen(repoName)
        case .fetchUserRepos:
            Task { @MainActor [weak self] in
                guard let self else { return }
                do {
                    dispatch(.showingSpinner(true))
                    state.userRepos = try await self.userReposUseCase.getUserRepos()
                    dispatch(.showingSpinner(false))
                } catch {
                    dispatch(.showingSpinner(false))
                    state.toast = Toast(
                        style: .error,
                        message: "Something went wrong. Try again later."
                    )
                }
            }
        case .showingSpinner(let isShowing):
            state.isLoading = isShowing
        }
    }
}
