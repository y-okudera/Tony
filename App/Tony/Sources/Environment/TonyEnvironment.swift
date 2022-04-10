//
//  TonyEnvironment.swift
//  Tony
//
//  Created by Yuki Okudera on 2022/03/14.
//

import SearchRepoFeatures
import SplashFeatures
import TonyCore

final class TonyEnvironment: Environment {
    var apiClient: APIClient {
        APIClientImpl.shared
    }

    func resolve<Descriptor: TypedDescriptor>(_ descriptor: Descriptor) -> Descriptor.Output {
        switch descriptor {
        case _ as ViewDescriptor.SplashDescriptor:
            return SplashViewBuilder.build(environment: self) as! Descriptor.Output
        case let d as ViewDescriptor.SearchRepoDescriptor:
            return SearchRepoViewBuilder.build(with: d, environment: self) as! Descriptor.Output
        case _ as UseCaseDescriptor.SearchGitHubRepoUseCaseDescriptor:
            return SearchGitHubRepoUseCaseImpl(environment: self) as! Descriptor.Output
        default:
            fatalError("unknown descriptor.")
        }
    }
}
