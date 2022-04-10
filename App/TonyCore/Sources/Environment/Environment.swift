//
//  Environment.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/13.
//

import Foundation
import UIKit

public protocol Environment {
    var apiClient: APIClient { get }

    /// Featureモジュールから他のFeatureモジュールの画面へ遷移させるための仕組み
    func resolve<Descriptor: TypedDescriptor>(_ descriptor: Descriptor) -> Descriptor.Output
}
