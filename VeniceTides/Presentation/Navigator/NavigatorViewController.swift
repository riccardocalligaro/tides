//
//  NavigatorViewController.swift
//  VeniceTides
//
//  Created by Riccardo on 05/12/20.
//

import UIKit

class NavigatorViewController: UITabBarController {

    // MARK: - Tabs set up

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        // create the view controllers
        let homeViewController = UINavigationController(rootViewController: HomeViewController())

        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)

        self.viewControllers = [homeViewController]
    }

}
