//
//  ViewDescriptor.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation
import UIKit

public enum ViewDescriptor {

    public struct SplashDescriptor: TypedDescriptor {
        public typealias Output = UIViewController
        public init() {
        }
    }

    public struct SearchRepoDescriptor: TypedDescriptor {
        public typealias Output = UIViewController
        public var initialSearchQuery: String
        public init(initialSearchQuery: String) {
            self.initialSearchQuery = initialSearchQuery
        }
    }
}
