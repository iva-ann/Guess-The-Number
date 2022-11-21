//
//  MainCoordinator.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import UIKit

protocol MainCoordinatorProtocol {
    // Push Screens
    func pushEnterNumberScreen()
    func pushComputerIsGuessingScreen()
    
}

final class MainCoordinator {
    
    private let navigationController: UINavigationController?
    private var viewControllers: [UIViewController] = []
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func startFlow() {
        let rootVC = MainScreenBuilder.buildModule(moduleOutput: self)
        viewControllers.append(rootVC)
        navigationController?.pushViewController(rootVC, animated: false)
    }
}

extension MainCoordinator {
    
    func popToRootViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func dismissViewController() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension MainCoordinator: MainCoordinatorProtocol {
    
    func pushEnterNumberScreen() {
        let viewController = EnterNumberBuilder.buildModule(moduleOutput: self)
        viewControllers.append(viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushComputerIsGuessingScreen() {
    }
    
}
