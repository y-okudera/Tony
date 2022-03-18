//
//  GitHubRepositoryTableViewCell.swift
//  TonyCore
//
//  Created by Yuki Okudera on 2022/03/15.
//

import UIKit

public final class GitHubRepositoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!

    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(title: String) {
        nameLabel.text = title
    }
}
