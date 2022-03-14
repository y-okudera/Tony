//
//  SearchRepoViewController.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import UIKit
import TonyCore

protocol SearchRepoView: AnyObject {
    func reloadList()
}

class SearchRepoViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        willSet {
            newValue.dataSource = self
            newValue.delegate = self
            newValue.register(
                UINib(nibName: "GitHubRepositoryTableViewCell", bundle: .core),
                forCellReuseIdentifier: "GitHubRepositoryTableViewCell"
            )
        }
    }

    var initialSearchQuery: String!
    var presenter: SearchRepoPresenter!

    private var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(String(describing: type(of: self)), #function)
        setupSearchBar()
    }

    func setupSearchBar() {
        guard let navigationBarFrame = navigationController?.navigationBar.bounds else {
            return
        }
        let searchBar: UISearchBar = UISearchBar(frame: navigationBarFrame)
        searchBar.delegate = self
        searchBar.placeholder = "リポジトリを探す"
        searchBar.keyboardType = .default
        navigationItem.titleView = searchBar
        navigationItem.titleView?.frame = searchBar.frame
        self.searchBar = searchBar
    }
}

extension SearchRepoViewController: SearchRepoView {
    func reloadList() {
        tableView.reloadData()
    }
}

extension SearchRepoViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchButtonClicked(searchQuery: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
}

extension SearchRepoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GitHubRepositoryTableViewCell", for: indexPath) as! GitHubRepositoryTableViewCell
        cell.configure(title: presenter.items[indexPath.row].fullName)
        return cell
    }
}

extension SearchRepoViewController: UITableViewDelegate {

}

extension SearchRepoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
        let edgeOffset: CGFloat = 100
        if bottomEdge >= scrollView.contentSize.height - edgeOffset {
            presenter.reachedBottom()
        }
    }
}
