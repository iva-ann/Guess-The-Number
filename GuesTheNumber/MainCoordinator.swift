//
//  MainCoordinator.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import UIKit

protocol MainCoordinatorProtocol {
    // Push Screens
    func pushComputerIsGuessingScreen()
    func pushUserIsGuesingScreen(_ model: ComputerCounter)
    func pushGameResultsScreen(_ model: CounterModel)
    func endFlow()
}

final class MainCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController?
    private weak var parentCoordinator: Coordinator?
    private var viewControllers: [UIViewController] = []
    
    // MARK: - Initialization
    
    init(navigationController: UINavigationController?,
         parentCoordinator: Coordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func startFlow() {
        let enterTheNumberVC = EnterNumberBuilder.buildModule(moduleOutput: self)
        navigationController?.pushViewController(enterTheNumberVC, animated: true)
    }
}

// MARK: - MainCoordinatorProtocol

extension MainCoordinator: MainCoordinatorProtocol {
    func pushComputerIsGuessingScreen() {
        let viewController = ComputerIsGuessingBuilder.buildModule(moduleOutput: self)
        viewControllers.append(viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushUserIsGuesingScreen(_ model: ComputerCounter) {
        let viewController = UserIsGuesisngBuilder.buildModule(moduleOutput: self, computerCounter: model)
        viewControllers.append(viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushGameResultsScreen(_ model: CounterModel) {
        let viewController = GameResultBuilder.buildModule(moduleOutput: self, counterModel: model)
        viewControllers.append(viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func endFlow(){
        parentCoordinator?.endChildFlow()
    }
}
