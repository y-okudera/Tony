//
//  SearchRepoViewBuilder.swift
//  SearchRepoFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import Foundation
import UIKit
import TonyCore

public enum SearchRepoViewBuilder {
    public static func build(with descriptor: ViewDescriptor.SearchRepoDescriptor, environment: Environment) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "SearchRepoViewController", bundle: .current)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchRepoViewController") as! SearchRepoViewController
        vc.initialSearchQuery = descriptor.initialSearchQuery

        let wireFrame = SearchRepoWireframeImpl()
        wireFrame.viewController = vc

        let presenter = SearchRepoPresenterImpl()
        presenter.environment = environment
        presenter.view = vc
        presenter.wireFrame = wireFrame

        vc.presenter = presenter
        
        return vc
    }
}
