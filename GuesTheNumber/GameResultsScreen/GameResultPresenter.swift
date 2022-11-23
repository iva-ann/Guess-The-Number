//
//  GameResultPresenter.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import Foundation
protocol GameResultsViewControllerOutput: AnyObject {
    
}
final class GameResultPresenter {
    
// MARK: - External dependencies

private let moduleOutput: MainCoordinatorProtocol?
    private let counterModel: CounterModel

init(moduleOutput: MainCoordinatorProtocol?,
     counterModel: CounterModel) {
    self.moduleOutput = moduleOutput
    self.counterModel = counterModel
}
    
    
}
