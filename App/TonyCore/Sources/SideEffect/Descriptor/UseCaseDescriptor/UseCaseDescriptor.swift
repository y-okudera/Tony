//
//  UseCaseDescriptor.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/22.
//  Copyright © 2022 yuoku. All rights reserved.
//

import Foundation

public enum UseCaseDescriptor {
    public struct SearchGitHubRepoUseCaseDescriptor: TypedDescriptor {
        public typealias Output = SearchGitHubRepoUseCase
        public init() {}
    }
}
