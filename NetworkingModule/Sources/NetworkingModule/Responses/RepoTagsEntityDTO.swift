//
//  RepoTagsEntityDTO.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct RepoTagsEntityDTO: Decodable {
    public let name: String
    public let commit: RepoCommitEntityDTO
}
