//
//  File.swift
//  
//
//  Created by Nikola Savic on 3.8.24..
//

import Foundation
import DomainModule
import NetworkingModule

extension OwnerEntityDTO {
    func toOwnerEntity() -> OwnerEntity {
        return .init(avatarUrl: avatarUrl)
    }
}
