//
//  Bundle+.swift
//  SplashFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation

extension Bundle {
    static var current: Bundle {
        class DummyClass {}
        return Bundle(for: type(of: DummyClass()))
    }
}
