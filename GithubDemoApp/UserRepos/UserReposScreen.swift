//
//  UserReposScreen.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 3.8.24..
//

import SwiftUI

struct UserReposScreen: View {
    @StateObject var viewModel: UserReposViewModel
    
    var body: some View {
        ScrollView {
            header
            ForEach(viewModel.state.userRepos, id: \.id) {
                repoView(name: $0.name, openedIssue: $0.openIssues)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
            }
        }
        .progressHUD(isShown: viewModel.state.isLoading)
        .toastView(toast: $viewModel.state.toast)
        .task {
            viewModel.dispatch(.fetchUserRepos)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundColor)
    }
    
    private var header: some View {
        Text("User Repos")
            .foregroundStyle(Color.gitHubWhite)
            .font(.system(size: 25, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
            .padding(.top, 20)
    }
    
    private func repoView(name: String, openedIssue: Int) -> some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Text("Repo Name: ")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.gitHubGreen)
                
                Text(name)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color.gitHubWhite)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 4) {
                Text("Opened Issues: ")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.gitHubGreen)
                
                Text("\(openedIssue)")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color.gitHubWhite)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            viewModel.dispatch(.openRepoDetailsScreen(name))
        }
    }
}
