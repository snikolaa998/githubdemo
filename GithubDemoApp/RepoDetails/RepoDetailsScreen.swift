//
//  RepoDetailsScreen.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 3.8.24..
//

import SwiftUI
import Kingfisher

struct RepoDetailsScreen: View {
    @StateObject var viewModel: RepoDetailsViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            header
            content
                .padding(.top, 24)
            
            Text("Repo Tags")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(Color.gitHubGreen)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
                .padding(.top, 16)
            
            ScrollView {
                tagsSection
                    .padding(.vertical, 8)
            }
            
            Spacer()
        }
        .progressHUD(isShown: viewModel.state.isLoading)
        .task {
            viewModel.dispatch(.fetchRepoDetails)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundColor)
    }
    
    @ViewBuilder
    private var tagsSection: some View {
        if viewModel.state.repoTags.isEmpty {
            Text("No available tags.")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
        } else {
            ForEach(viewModel.state.repoTags, id: \.name) {
                tagView(name: $0.name, description: $0.commit.sha)
                    .padding(.top, 8)
            }
        }
    }
    
    private func tagView(name: String, description: String) -> some View {
        VStack(spacing: 6) {
            Text(name)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.gitHubGreen)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(description)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(Color.gitHubWhite)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
    }
    
    private var content: some View {
        VStack(spacing: 10) {
            HStack(spacing: 8) {
                avatarImage(avatarUrl: viewModel.state.repoDetails?.owner.avatarUrl)
                Text(viewModel.state.repoDetails?.fullName ?? viewModel.repoName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.gitHubGreen)
                
                Spacer()
            }
            dataView(title: "Forks: ", description: viewModel.state.repoDetails?.forksCount)
            dataView(title: "Watchers: ", description: viewModel.state.repoDetails?.watchersCount)
        }
        .padding(.horizontal, 24)
    }
    
    private func dataView(title: String, description: Int?) -> some View {
        HStack(spacing: 8) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.gitHubGreen)
            
            if let description {
                Text("\(description)")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color.gitHubWhite)
            } else {
                Text("No available data.")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color.gitHubWhite)
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func avatarImage(avatarUrl: String?) -> some View {
        if let urlString = avatarUrl, let url = URL(string: urlString) {
            KFImage(url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        } else {
            Image(.mockAvatarIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
    }
    
    private var header: some View {
        HStack(spacing: .zero) {
            Spacer()
            Text(viewModel.repoName)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.gitHubWhite)
                .font(.system(size: 16, weight: .semibold))
                .overlay(alignment: .leading) {
                    Button {
                        viewModel.dispatch(.dismiss)
                    } label: {
                        Image(.icArrowBack)
                            .renderingMode(.template)
                            .tint(.white)
                            .padding(.leading, 24)
                    }
                }
            Spacer()
        }
        .padding(.top, 16)
        .frame(maxWidth: .infinity)
    }
}
