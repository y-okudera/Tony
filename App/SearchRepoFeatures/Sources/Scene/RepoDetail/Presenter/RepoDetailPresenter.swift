//
//  RepoDetailPresenter.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/16.
//

import Foundation
import TonyCore

// MARK: - Interface
protocol RepoDetailPresenter {

}

// MARK: - Implementation
final class RepoDetailPresenterImpl: RepoDetailPresenter {
    weak var view: RepoDetailView?
    var wireFrame: RepoDetailWireframe!
    var environment: Environment!
}
