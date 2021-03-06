//
//  SandboxSceneDelegate.swift
//  SearchRepoFeaturesSandbox
//
//  Created by Yuki Okudera on 2022/03/21.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import SandboxCore
import TonyCore
import UIKit

class SandboxSceneDelegate: UIResponder, UIWindowSceneDelegate {

    private let environment = StubbableEnvironment()
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        let rootViewController = environment.resolve(ViewDescriptor.SearchRepoDescriptor(initialSearchQuery: ""))
        window.rootViewController = UINavigationController(rootViewController: rootViewController)
    }
}
