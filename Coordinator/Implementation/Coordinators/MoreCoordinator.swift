//
//  MoreCoordinator.swift
//  Coordinator
//
//  Created by Ben Shutt on 22/10/2024.
//

import UIKit

class MoreCoordinator: Coordinator {
    weak var mainCoordinator: MainCoordinator?
    let navigationController = UINavigationController()

    var rootViewController: UIViewController {
        navigationController
    }

    init() {
        navigationController.setViewControllers(
            [makeRootViewController()],
            animated: false
        )
    }
    
    func makeRootViewController() -> UIViewController {
        let viewController = MoreViewController()
        viewController.coordinator = self
        return viewController
    }

    func pushDetail() {
        let viewController = MoreDetailViewController()
        viewController.coordinator = self
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }

    func selectHome() {
        mainCoordinator?.selectHome()
    }
}
