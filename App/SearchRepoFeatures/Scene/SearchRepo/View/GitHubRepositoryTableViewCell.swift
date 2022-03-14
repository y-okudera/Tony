//
//  GitHubRepositoryTableViewCell.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/15.
//

import UIKit

class GitHubRepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
