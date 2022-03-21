//
//  StubbableEnvironment.swift
//  SandboxCore
//
//  Created by Yuki Okudera on 2022/03/22.
//  Copyright © 2022 yuoku. All rights reserved.
//

import SearchRepoFeatures
import TonyCore

public final class StubbableEnvironment: Environment {

    public init() {}

    public var apiClient: APIClient {
        APIClientStub.shared
    }

    public func resolve<Descriptor: TypedDescriptor>(_ descriptor: Descriptor) -> Descriptor.Output {
        switch descriptor {
        case let d as ViewDescriptor.SearchRepoDescriptor:
            return SearchRepoViewBuilder.build(with: d, environment: self) as! Descriptor.Output
        case _ as UseCaseDescriptor.SearchGitHubRepoUseCaseDescriptor:
            return SearchGitHubRepoUseCaseStub(environment: self) as! Descriptor.Output
        default:
            fatalError("unknown descriptor.")
        }
    }
}
