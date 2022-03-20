//
//  StubbableEnvironment.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/21.
//  Copyright © 2022 Yuki Okudera. All rights reserved.
//

import SearchRepoFeatures
import TonyCore

final class StubbableEnvironment: Environment {

    var apiClient: APIClient {
        APIClientStub.shared
    }

    func resolve<Descriptor: TypedDescriptor>(_ descriptor: Descriptor) -> Descriptor.Output {
        switch descriptor {
        case let d as ViewDescriptor.SearchRepoDescriptor:
            return SearchRepoViewBuilder.build(with: d, environment: self) as! Descriptor.Output
        default:
            fatalError("unknown descriptor.")
        }
    }
}
