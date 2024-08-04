//
//  View+UIHostingController.swift
//  GithubDemoApp
//
//  Created by Nikola Savic on 2.8.24..
//

import SwiftUI

extension View {
    var hosted: UIViewController {
        return UIHostingController(rootView: self)
    }
}

extension UINavigationController: UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
        delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
