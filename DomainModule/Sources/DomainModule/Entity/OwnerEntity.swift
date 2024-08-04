//
//  OwnerEntity.swift
//  
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct OwnerEntity: Equatable {
    public let avatarUrl: String
    
    public init(avatarUrl: String) {
        self.avatarUrl = avatarUrl
    }
}
