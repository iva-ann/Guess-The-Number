//
//  EnterNumberBuilder.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

final class EnterNumberBuilder {
    static func buildModule(moduleOutput: MainCoordinatorProtocol? = nil) -> EnterNumberViewController {
        let viewController = EnterNumberViewController()
        let presenter = EnterNumberPresenter(moduleOutput: moduleOutput)
        viewController.presenter = presenter
        
        return viewController
    }
}
