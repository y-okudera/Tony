//
//  SearchRepositoryRequest.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/13.
//

import Foundation

public struct SearchRepositoryRequest: APIRequestable {
    public typealias Response = SearchRepositoryResponse

    private let searchQuery: String
    private let page: Int

    public init(searchQuery: String, page: Int = 1) {
        self.searchQuery = searchQuery
        self.page = page
    }

    public var path: String {
        return "/search/repositories"
    }

    public var method: String {
        return "GET"
    }

    public var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: searchQuery),
            .init(name: "order", value: "desc"),
            .init(name: "per_page", value: "20"),
            .init(name: "page", value: page.description),
        ]
    }
}
