//
//  ViewModel.swift
//  
//
//  Created by Nikola Savic on 2.8.24..
//

import Foundation

public protocol ViewModel: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action
    func dispatch(_ action: Action)
}
