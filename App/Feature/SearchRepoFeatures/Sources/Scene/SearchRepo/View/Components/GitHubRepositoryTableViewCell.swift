//
//  GitHubRepositoryTableViewCell.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/15.
//

import SharedResource
import UIKit

final class GitHubRepositoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!

    @IBOutlet private weak var heartImageView: UIImageView! {
        willSet {
            newValue.isUserInteractionEnabled = true
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedHeartImage))
            newValue.addGestureRecognizer(gestureRecognizer)
        }
    }

    private var isFavorited = false {
        didSet {
            if isFavorited {
                heartImageView.image = Asset.heartOn.image.withRenderingMode(.alwaysOriginal)
            } else {
                heartImageView.image = Asset.heartOff.image.withRenderingMode(.alwaysTemplate)
                heartImageView.tintColor = UITraitCollection.current.userInterfaceStyle == .dark ? .white : .black
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        isFavorited = false
    }

    func configure(title: String) {
        self.selectionStyle = .none
        nameLabel.text = title
        isFavorited = false
    }

    @objc
    private func tappedHeartImage() {
        isFavorited.toggle()
    }
}
