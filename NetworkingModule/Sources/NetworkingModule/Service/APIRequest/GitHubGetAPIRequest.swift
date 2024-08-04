//
//  GitHubGetAPIRequest.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public protocol GitHubGetAPIRequest: GitHubAPIRequest {}

public extension GitHubGetAPIRequest {
    func generateURLRequest() -> URLRequest? {
        guard let url = createURL() else {
            return nil
        }
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: 60)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        return request
    }
}
