//
//  OwnerEntityDTO.swift
//
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation

public struct OwnerEntityDTO: Decodable {
    public let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}
