//
//  SearchGitHubRepoUseCase.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/22.
//  Copyright © 2022 yuoku. All rights reserved.
//

import Foundation

public protocol SearchGitHubRepoUseCase {
    var environment: Environment { get }
    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepositoryResponse>
}
