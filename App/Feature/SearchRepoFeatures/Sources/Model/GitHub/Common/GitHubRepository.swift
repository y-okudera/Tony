//
//  GitHubRepository.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/13.
//

import Foundation

public struct GitHubRepository: Decodable {
    public let id: Int64
    public let fullName: String
    public let description: String?
    public let stargazersCount: Int
    public let language: String?
    public let htmlUrl: URL
    public let owner: GitHubUser
}
