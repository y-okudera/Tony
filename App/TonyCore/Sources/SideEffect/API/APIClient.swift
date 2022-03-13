//
//  APIClient.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/13.
//

import Foundation

public protocol APIClient {
    func sendRequest<T: APIRequestable>(_ apiRequest: T) async throws -> APIResponse<T.Response>
}
