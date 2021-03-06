//
//  SearchRepoPresenter.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation
import TonyCore

protocol SearchRepoPresenter {
    var items: [GitHubRepository] { get }
    var isLoading: Bool { get }
    func searchButtonClicked(searchQuery: String)
    func reachedBottom()
    func didSelectItem(at indexPath: IndexPath)
}

final class SearchRepoPresenterImpl: SearchRepoPresenter {

    weak var view: SearchRepoView?
    var wireFrame: SearchRepoWireframe!
    var searchGitHubRepoUseCase: SearchGitHubRepoUseCase!

    var items: [GitHubRepository] = []
    var isLoading: Bool = false
    private var searchQuery = ""
    private var page = 1

    func searchButtonClicked(searchQuery: String) {
        guard !isLoading else {
            return
        }
        isLoading = true
        self.searchQuery = searchQuery
        page = 1
        print("初回読み込み！")
        Task {
            do {
                let result = try await searchGitHubRepoUseCase.execute(searchQuery: searchQuery, page: page)
                print("statusCode", result.statusCode)
                items = result.response.items

                DispatchQueue.main.async { [weak self] in
                    self?.view?.reloadList()
                }
                isLoading = false
            } catch {
                print(error)
                isLoading = false
                #warning("Show error dialog.")
            }
        }
    }

    func reachedBottom() {
        guard !items.isEmpty else {
            return
        }
        guard !isLoading else {
            return
        }
        isLoading = true
        page += 1
        print("追加読み込み！ page:", page)
        Task {
            do {
                let result = try await searchGitHubRepoUseCase.execute(searchQuery: searchQuery, page: page)
                print("statusCode", result.statusCode)
                items.append(contentsOf: result.response.items)

                DispatchQueue.main.async { [weak self] in
                    self?.view?.reloadList()
                }
                isLoading = false
            } catch {
                print(error)
                page -= 1
                isLoading = false
                #warning("Show error dialog.")
            }
        }
    }

    func didSelectItem(at indexPath: IndexPath) {
        print(#function, indexPath.row, items[indexPath.row])
    }
}
