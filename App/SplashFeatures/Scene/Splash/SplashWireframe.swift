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
        let vc = environment.resolve(ViewDescriptor.SearchRepoDescriptor(initialSearchQuery: "Swift"))
        viewController?.present(vc, animated: true)
    }
}
