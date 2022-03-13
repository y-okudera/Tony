//
//  GitHubUser.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/13.
//

import Foundation

public struct GitHubUser: Decodable {
  public let id: Int64
  public let login: String
  public let avatarUrl: URL
  public let htmlUrl: URL
  public let type: String
}
