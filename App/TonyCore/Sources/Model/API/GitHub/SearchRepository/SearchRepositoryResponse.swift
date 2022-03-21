//
//  SearchRepositoryResponse.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation

public struct SearchRepositoryResponse: Decodable {
    public let items: [GitHubRepository]
}
