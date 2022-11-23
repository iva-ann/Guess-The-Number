//
//  ComputerIsGuessingBuilder.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import Foundation

final class ComputerIsGuessingBuilder {
    static func buildModule(moduleOutput: MainCoordinatorProtocol? = nil) -> ComputerIsGuessingViewController {
        let viewController = ComputerIsGuessingViewController()
        let presenter = ComputerIsGuessigPresenter(
            moduleOutput: moduleOutput,
            view: viewController
        )
        viewController.presenter = presenter
        
        return viewController
    }
}
