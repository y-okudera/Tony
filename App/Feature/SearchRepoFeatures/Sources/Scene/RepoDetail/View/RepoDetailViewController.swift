//
//  RepoDetailViewController.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/16.
//

import UIKit

// MARK: - Interface
protocol RepoDetailView: AnyObject {
    var presenter: RepoDetailPresenter! { get }
}

// MARK: - Implementation
final class RepoDetailViewController: UIViewController {

    // MARK: - Properties
    var presenter: RepoDetailPresenter!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - RepoDetailView
extension RepoDetailViewController: RepoDetailView {

}
