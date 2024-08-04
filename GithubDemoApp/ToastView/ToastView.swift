//
//  ToastView.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 3.8.24..
//

import SwiftUI

struct ToastView: View {
    var style: ToastStyle
    var message: String
    var width = CGFloat.infinity
    var onCancelTapped: (() -> Void)
    
    public var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: style.iconFileName)
                .foregroundColor(Color.white)
            
            Text(message)
                .font(Font.caption)
                .foregroundColor(Color.white)
            
            Spacer(minLength: 10)
            
            Button {
                onCancelTapped()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color.white)
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: width)
        .background(Color.gitHubGreen)
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
}
