//
//  GitHubRepositoryTableViewCell.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/15.
//

import UIKit

public final class GitHubRepositoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!

    public func configure(title: String) {
        nameLabel.text = title
    }
}
