//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Ben Shutt on 22/10/2024.
//

import UIKit

class MainCoordinator: Coordinator {
    let homeCoordinator = HomeCoordinator()
    lazy var moreCoordinator = {
        let coordinator = MoreCoordinator()
        coordinator.mainCoordinator = self
        return coordinator
    }()
    let tabBarController = UITabBarController()

    var rootViewController: UIViewController {
        tabBarController
    }

    private var tabCoordinators: [Coordinator] {
        [homeCoordinator, moreCoordinator]
    }

    init() {
        tabBarController.setViewControllers(
            tabCoordinators.map { $0.rootViewController },
            animated: false)
    }

    func selectHome() {
        let homeIndex = tabCoordinators.firstIndex { $0 === homeCoordinator }
        guard let homeIndex else { return }
        tabBarController.selectedIndex = homeIndex
        homeCoordinator.popToRoot()
    }
}
