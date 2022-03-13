//
//  SearchRepoPresenter.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation
import TonyCore

protocol SearchRepoPresenter {
    // TODO: -
}

final class SearchRepoPresenterImpl: SearchRepoPresenter {

    weak var view: SearchRepoView?
    var wireFrame: SearchRepoWireframe!
    var environment: Environment!
}

