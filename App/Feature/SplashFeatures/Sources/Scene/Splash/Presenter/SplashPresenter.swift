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

    func viewDidAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.wireFrame.presentSearchRepo()
        }
    }
}
