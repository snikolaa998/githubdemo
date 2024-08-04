//
//  Coordinator+Extension.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 2.8.24..
//

import UIKit

extension Coordinator {
    var mainCoordinator: MainCoordinator? {
        func searchForMainCoordinator() -> MainCoordinator? {
            if let mainCoordinator = self as? MainCoordinator {
                return mainCoordinator
            }
            guard let mainCoordinator = parentCoordinator as? MainCoordinator else {
                parentCoordinator = parentCoordinator?.parentCoordinator
                return parentCoordinator == nil ? nil : searchForMainCoordinator()
            }

            return mainCoordinator
        }

        return searchForMainCoordinator()
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    func popViewController(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    func present(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }
}
