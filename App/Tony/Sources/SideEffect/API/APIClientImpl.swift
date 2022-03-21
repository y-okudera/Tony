//
//  APIClientImpl.swift
//  Tony
//
//  Created by Yuki Okudera on 2022/03/14.
//

import TonyCore

final class APIClientImpl: APIClient {
    static let shared = APIClientImpl()
    private init() {}

    func sendRequest<T: APIRequestable>(_ apiRequest: T) async throws -> APIResponse<T.Response> {
        guard let urlRequest = apiRequest.urlRequest else {
            throw APIError.invalidRequest
        }
        do {
            let result = try await URLSession.shared.data(for: urlRequest)
            let apiResponse = try validate(data: result.0, response: result.1, apiRequest: apiRequest)
            return apiResponse
        } catch let apiError as APIError {
            throw apiError
        } catch {
            throw APIError.invalidResponse(error)
        }
    }

    private func validate<T: APIRequestable>(data: Data, response: URLResponse, apiRequest: T) throws -> APIResponse<T.Response> {
        guard let httpURLResponse = (response as? HTTPURLResponse) else {
            throw APIError.invalidResponse(URLError(.badServerResponse))
        }
        switch httpURLResponse.statusCode {
        case 200...299:
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let responseObject = try decoder.decode(T.Response.self, from: data)
                return APIResponse(response: responseObject, httpURLResponse: httpURLResponse)
            } catch let decodingError as DecodingError {
                throw APIError.decodeError(decodingError)
            }
        case 400...499:
            throw APIError.clientError(httpURLResponse.statusCode)
        case 500...599:
            throw APIError.serverError(httpURLResponse.statusCode)
        default:
            throw APIError.invalidResponse(URLError(.badServerResponse))
        }
    }
}
