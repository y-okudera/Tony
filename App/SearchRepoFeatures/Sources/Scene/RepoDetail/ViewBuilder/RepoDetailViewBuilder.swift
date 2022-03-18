//
//  RepoDetailViewBuilder.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/16.
//

import TonyCore
import UIKit

public enum RepoDetailViewBuilder {
    public static func build(with environment: Environment) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "RepoDetailViewController", bundle: .current)
        let vc = storyboard.instantiateViewController(withIdentifier: "RepoDetailViewController") as! RepoDetailViewController

        let wireFrame = RepoDetailWireframeImpl()
        wireFrame.viewController = vc

        let presenter = RepoDetailPresenterImpl()
        presenter.environment = environment
        presenter.view = vc
        presenter.wireFrame = wireFrame

        vc.presenter = presenter

        return vc
    }
}
