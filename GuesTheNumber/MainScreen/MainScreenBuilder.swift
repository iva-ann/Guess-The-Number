//
//  MainScreenBuilder.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

//final class LoginScreenAssembly {
//    
//    typealias PresenterInput = LoginScreenViewControllerOutput & LoginScreenInteractorOutput
//
//    // MARK: - Static method to build Login VIPER Module
//    
//    static func buildModule(moduleOutput: AuthorisationCoordinatorProtocol? = nil) -> LoginScreenViewController {
//        let viewController = LoginScreenViewController()
//        let provider = LoginScreenProvider(authorizationService: AuthorizationService())
//        let interactor = LoginScreenInteractor(provider: provider)
//        let presenter: PresenterInput = LoginScreenPresenter(for: viewController, with: interactor, with: moduleOutput)
//
//        viewController.output = presenter
//        interactor.setUpPresenter(presenter)
//        
//        return viewController
//    }
//}

final class MainScreenBuilder {
    static func buildModule(moduleOutput: MainCoordinatorProtocol? = nil) -> MainScreenViewController {
        let viewController = MainScreenViewController()
        let presenter = MainScreenPresenter(moduleOutput: moduleOutput)
        viewController.presenter = presenter
        
        return viewController
    }
}
