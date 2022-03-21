//
//  SearchGitHubRepoUseCaseStub.swift
//  SandboxCore
//
//  Created by Yuki Okudera on 2022/03/22.
//  Copyright © 2022 yuoku. All rights reserved.
//

import TonyCore

struct SearchGitHubRepoUseCaseStub: SearchGitHubRepoUseCase {

    let environment: Environment

    #warning("JSONファイルから生成したStubを返すようにする")
    func execute(searchQuery: String, page: Int) async throws -> APIResponse<SearchRepositoryResponse> {
        return try await environment.apiClient.sendRequest(SearchRepositoryRequest(searchQuery: searchQuery, page: page))
    }
}
