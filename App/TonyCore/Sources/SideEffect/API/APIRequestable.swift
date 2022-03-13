//
//  APIRequestable.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/13.
//

import Foundation

public protocol APIRequestable {
    associatedtype Response: Decodable

    var baseUrl: String { get }
    var path: String { get }
    var method: String { get }

    var headerFields: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
    var bodyItems: [String: Any]? { get }

    var urlRequest: URLRequest? { get }
}

extension APIRequestable {
    public var baseUrl: String {
        return "https://api.github.com"
    }

    public var headerFields: [String: String] {
        return [:]
    }

    public var queryItems: [URLQueryItem]? {
        return nil
    }

    public var bodyItems: [String: Any]? {
        return nil
    }

    public var urlRequest: URLRequest? {
        let url: URL? = {
            var urlComponents = URLComponents(string: baseUrl + path)
            urlComponents?.queryItems = queryItems
            return urlComponents?.url
        }()

        print("URL", url ?? "")

        guard let url = url else {
            return nil
        }
        let urlRequest: URLRequest = {
            var request = URLRequest(url: url)
            request.httpMethod = method
            headerFields.forEach { key, value in
                request.addValue(value, forHTTPHeaderField: key)
            }
            if let bodyItems = self.bodyItems, let httpBody = try? JSONSerialization.data(withJSONObject: bodyItems, options: []) {
                request.httpBody = httpBody
            }
            return request
        }()

        return urlRequest
    }
}
