//
//  Bundle+.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/15.
//

import Foundation

extension Bundle {
    public static var core: Bundle {
        class DummyClass {}
        return Bundle(for: type(of: DummyClass()))
    }
}
