//
//  HomeViewController.swift
//  VeniceTides
//
//  Created by Riccardo on 05/12/20.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeView = HomeView()

    // MARK: - Load view

    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        self.navigationItem.title = "Home"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
