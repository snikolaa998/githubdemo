//
//  Loader.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 3.8.24..
//

import SwiftUI

public struct Loader: ViewModifier {
    private let isLoading: Bool
    
    public init(
        _ isLoading: Bool
    ) {
        self.isLoading = isLoading
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                spinner
            }
        }
    }
    
    private var spinner: some View {
        ProgressView()
            .padding(30)
            .tint(Color.gitHubGreen)
            .background(Color.white.opacity(0.5))
            .cornerRadius(15)
            .frame(width: 60, height: 60)
    }
}

public extension View {
    func progressHUD(isShown: Bool) -> some View {
        modifier(Loader(isShown))
    }
}
