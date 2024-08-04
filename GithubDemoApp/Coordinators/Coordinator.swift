//
//  Coordinator.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 2.8.24..
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController { get set }
    
    func begin()
    
    func popViewController(animated: Bool)
    func pushViewController(_ viewController: UIViewController, animated: Bool)
}
