//
//  SearchRepositoryResponse.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation

struct SearchRepositoryResponse: Decodable {
    let items: [GitHubRepository]
}
