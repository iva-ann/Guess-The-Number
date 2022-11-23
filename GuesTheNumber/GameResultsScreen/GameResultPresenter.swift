//
//  GameResultPresenter.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import Foundation

protocol GameResultsViewControllerOutput: AnyObject {
    func displayCommonScores()
    func displayResult()
    func backToStartButtonTapped()
}
final class GameResultPresenter {
    
    // MARK: - Private Properties
    
    private let moduleOutput: MainCoordinatorProtocol?
    private let counterModel: CounterModel
    private let view: GameResultsViewControllerInput?
    
    // MARK: - Initialization
    
    init(moduleOutput: MainCoordinatorProtocol?,
         counterModel: CounterModel,
         view: GameResultsViewControllerInput) {
        self.moduleOutput = moduleOutput
        self.counterModel = counterModel
        self.view = view
    }
    
    // MARK: - Private Methods
    
    private func compareScores() -> String {
        let userScores = counterModel.userCounter.count
        let computerScores = counterModel.computerCounter.count
        var result = ""
        
        if userScores == computerScores {
            result = "Both are great"
        }
        
        if userScores < computerScores {
            result =  "You Win"
        }
        
        if userScores > computerScores {
            result =  "Computer Win"
        }
        
        return result
    }
}

// MARK: - GameResultsViewControllerOutput

extension GameResultPresenter: GameResultsViewControllerOutput {
    func displayResult() {
        let result = compareScores()
        let viewModel = ResultModel(result: result)
        view?.configureResultLabel(viewModel)
    }
    
    func displayCommonScores() {
        view?.configureScoreLabels(counterModel)
    }
    
    func backToStartButtonTapped(){
        moduleOutput?.endFlow()
    }
}
