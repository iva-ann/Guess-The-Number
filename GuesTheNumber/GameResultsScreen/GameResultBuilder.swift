//
//  GameResultBuilder.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

final class GameResultBuilder {
    static func buildModule(moduleOutput: MainCoordinatorProtocol? = nil, counterModel: CounterModel) -> GameResultsViewController {
        let viewController = GameResultsViewController()
        let presenter = GameResultPresenter(
            moduleOutput: moduleOutput,
            counterModel: counterModel)
//        viewController.presenter = presenter
        
        return viewController
    }
}

