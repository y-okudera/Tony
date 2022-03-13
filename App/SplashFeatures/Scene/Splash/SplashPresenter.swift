//
//  SplashPresenter.swift
//  SplashFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation
import TonyCore

// TODO: -

protocol SplashPresenter {
    func viewDidAppear()
}

final class SplashPresenterImpl: SplashPresenter {

    weak var view: SplashView?
    var wireFrame: SplashWireframe!
    var environment: Environment!

    func viewDidAppear() {
        wireFrame.presentSearchRepo(environment: environment)
    }
}
