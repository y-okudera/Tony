//
//  SearchRepoWireframe.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation
import TonyCore
import UIKit

protocol SearchRepoWireframe: AnyObject {
    // FIXME: -
    func presentFoo(environment: Environment)
}

final class SearchRepoWireframeImpl: SearchRepoWireframe {
    weak var viewController: UIViewController?

    func presentFoo(environment: Environment) {
        // TODO: -
    }
}
