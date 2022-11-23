//
//  MainScreenBuilder.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

final class GameStartBuilder {
    static func buildModule(moduleOutput: StartGameCoordinatorProtocol? = nil) -> GameStartViewController {
        let viewController = GameStartViewController()
        let presenter = GameStartPresenter(moduleOutput: moduleOutput)
        viewController.presenter = presenter
        
        return viewController
    }
}
