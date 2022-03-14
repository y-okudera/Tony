//
//  SplashViewBuilder.swift
//  SplashFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation
import UIKit
import TonyCore

public enum SplashViewBuilder {
    public static func build(environment: Environment) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "SplashViewController", bundle: .current)
        let vc = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController

        let wireFrame = SplashWireframeImpl()
        wireFrame.viewController = vc

        let presenter = SplashPresenterImpl()
        presenter.environment = environment
        presenter.view = vc
        presenter.wireFrame = wireFrame

        vc.presenter = presenter
        return vc
    }
}

