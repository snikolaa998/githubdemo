//
//  RepoDetailsViewModel.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation
import DomainModule

final class RepoDetailsViewModel: ViewModel {
    struct State: Equatable {
        var repoDetails: UserRepoEntity?
        var repoTags: [RepoTagsEntity] = []
        var isLoading = false
        var toast: Toast?
    }
    
    enum Action {
        case dismiss
        case fetchRepoDetails
        case showingSpinner(Bool)
    }
    
    @Published var state = State()
    
    let repoName: String
    private let repoDetailsUseCase: UserReposUseCaseProtocol
    private let onDismiss: () -> Void
    
    init(repoName: String, repoDetailsUseCase: UserReposUseCaseProtocol, onDismiss: @escaping () -> Void) {
        self.repoName = repoName
        self.repoDetailsUseCase = repoDetailsUseCase
        self.onDismiss = onDismiss
    }
    
    func dispatch(_ action: Action) {
        switch action {
        case .dismiss:
            onDismiss()
        case .fetchRepoDetails:
            Task { @MainActor [weak self] in
                guard let self else { return }
                
                async let repoDetails = self.repoDetailsUseCase.getRepoDetails(repoName: repoName)
                async let repoTags = self.repoDetailsUseCase.getRepoTags(repoName: repoName)

                do {
                    dispatch(.showingSpinner(true))
                    state.repoDetails = try await repoDetails
                    state.repoTags = try await repoTags
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
