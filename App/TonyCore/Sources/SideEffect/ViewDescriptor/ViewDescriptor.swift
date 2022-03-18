//
//  ViewDescriptor.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation
import UIKit

public protocol TypedDescriptor {
    associatedtype Output: UIViewController
}

public enum ViewDescriptor {
    public struct SearchRepoDescriptor: TypedDescriptor {
        public typealias Output = UIViewController
        public var initialSearchQuery: String
        public init(initialSearchQuery: String) {
            self.initialSearchQuery = initialSearchQuery
        }
    }
}
