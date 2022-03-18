//
//  SplashViewController.swift
//  SplashFeatures
//
//  Created by Yuki Okudera on 2022/03/14.
//

import UIKit

protocol SplashView: AnyObject {

}

class SplashViewController: UIViewController {

    var presenter: SplashPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(String(describing: type(of: self)), #function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(String(describing: type(of: self)), #function)
        presenter.viewDidAppear()
    }
}

extension SplashViewController: SplashView {

}
