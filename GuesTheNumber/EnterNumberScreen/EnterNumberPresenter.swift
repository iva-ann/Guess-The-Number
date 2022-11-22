//
//  EnterNumberPresenter.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import Foundation

protocol EnterNumberViewControllerOutput {
    func enterNumberButtonTapped()
}

final class EnterNumberPresenter: EnterNumberViewControllerOutput {
    
    // MARK: - External dependencies
    
    private let moduleOutput: MainCoordinatorProtocol?
    
    init(moduleOutput: MainCoordinatorProtocol?) {
        self.moduleOutput = moduleOutput
    }

    func enterNumberButtonTapped() {
        moduleOutput?.pushComputerIsGuessingScreen()
    }
}

