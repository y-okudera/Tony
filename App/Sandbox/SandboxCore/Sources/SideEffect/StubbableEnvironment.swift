//
//  StubbableEnvironment.swift
//  SandboxCore
//
//  Created by Yuki Okudera on 2022/03/22.
//  Copyright © 2022 yuoku. All rights reserved.
//

import TonyCore

public final class StubbableEnvironment: Environment {

    public init() {}

    public var apiClient: APIClient {
        APIClientStub.shared
    }

    public func resolve<Descriptor: TypedDescriptor>(_ descriptor: Descriptor) -> Descriptor.Output {
        fatalError("unknown descriptor.")
    }
}
