//
//  MainScreenPresenter.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import Foundation

protocol MainScreenViewControllerOutput {
    func startButtonTapped()
}

final class MainScreenPresenter: MainScreenViewControllerOutput {
    
    // MARK: - External dependencies
    
    private let moduleOutput: MainCoordinatorProtocol?
    
    init(moduleOutput: MainCoordinatorProtocol?) {
        self.moduleOutput = moduleOutput
    }

    func startButtonTapped() {
        moduleOutput?.pushEnterNumberScreen()
    }
}


