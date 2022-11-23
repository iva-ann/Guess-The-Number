//
//  StartGameCoordinator.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import UIKit

protocol StartGameCoordinatorProtocol: AnyObject {
    func pushEnterNumberScreen()
}

final class StartGameCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController?
    private weak var parentCoordinator: Coordinator?
    private var childCoordinators: [Coordinator]?
    private var viewControllers: [UIViewController] = []
    
    // MARK: - Initialization
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func startFlow() {
        let rootVC = GameStartBuilder.buildModule(moduleOutput: self)
        viewControllers.append(rootVC)
        navigationController?.pushViewController(rootVC, animated: false)
    }
}

// MARK: - StartGameCoordinatorProtocol

extension StartGameCoordinator: StartGameCoordinatorProtocol {
    func pushEnterNumberScreen() {
        if let childCoordinators = childCoordinators {
            for coordinator in childCoordinators {
                if let coordinator = coordinator as? MainCoordinator {
                    coordinator.startFlow()
                    return
                }
            }
        }
        let mainCoordinator = MainCoordinator(navigationController: navigationController, parentCoordinator: self)
        childCoordinators?.append(mainCoordinator)
        mainCoordinator.startFlow()
    }
    
    func endChildFlow() {
        if let vc = viewControllers.last {
            navigationController?.popToViewController(vc, animated: true)
            navigationController?.navigationBar.isHidden = false
        }
    }
}
