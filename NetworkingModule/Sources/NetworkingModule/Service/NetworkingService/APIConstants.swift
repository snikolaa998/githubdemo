//
//  APIConstants.swift
//  
//
//  Created by Nikola Savic on 2.8.24..
//

import Foundation

public struct APIConstants {
    public static let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
}
