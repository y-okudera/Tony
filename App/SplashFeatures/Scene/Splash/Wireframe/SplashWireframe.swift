//
//  SplashWireframe.swift
//  SplashFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation
import TonyCore
import UIKit

protocol SplashWireframe: AnyObject {
    func presentSearchRepo(environment: Environment)
}

final class SplashWireframeImpl: SplashWireframe {
    weak var viewController: UIViewController?

    func presentSearchRepo(environment: Environment) {
        let searchRepoVC = environment.resolve(ViewDescriptor.SearchRepoDescriptor(initialSearchQuery: "Swift"))
        let navigationController = UINavigationController(rootViewController: searchRepoVC)
        navigationController.modalPresentationStyle = .fullScreen
        viewController?.present(navigationController, animated: true)
    }
}
