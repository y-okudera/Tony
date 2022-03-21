//
//  SearchGitHubRepoUseCaseImpl.swift
//  Tony
//
//  Created by Yuki Okudera on 2022/03/22.
//  Copyright © 2022 yuoku. All rights reserved.
//

import TonyCore

struct SearchGitHubRepoUseCaseImpl: SearchGitHubRepoUseCase {

    let environment: Environment

    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepositoryResponse> {
        return try await environment.apiClient.sendRequest(SearchRepositoryRequest(searchQuery: searchQuery, page: page))
    }
}
