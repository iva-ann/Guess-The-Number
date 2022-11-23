//
//   UserIsGuesisngBuilder.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//


final class UserIsGuesisngBuilder {
    static func buildModule(moduleOutput: MainCoordinatorProtocol? = nil, computerCounter: ComputerCounter) -> UserIsGuesisngViewController {
        let viewController = UserIsGuesisngViewController()
        let presenter = UserIsGuesisngPresenter(
            moduleOutput: moduleOutput,
            view: viewController,
            computerCounter: computerCounter)
        viewController.presenter = presenter
        
        return viewController
    }
}
