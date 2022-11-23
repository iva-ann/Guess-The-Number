//
//  UserIsGuesisngPresenter.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import Foundation

protocol UserIsGuesisngViewControllerOutput {
    func guessButtonTapped(_ input: InputModel)
    func displayUserCounter(_ count: Int)
}

final class UserIsGuesisngPresenter {
    
    // MARK: - Private Properties
    
    private let randomNumber = Array(1...100).randomElement()
    private var computerCounter: ComputerCounter
    private var userCounter = 1
    
    private let moduleOutput: MainCoordinatorProtocol?
    private let view: UserIsGuesisngViewControllerInput?
    
    // MARK: - Initialization
    
    init(moduleOutput: MainCoordinatorProtocol?,
         view: UserIsGuesisngViewControllerInput?,
         computerCounter: ComputerCounter) {
        self.moduleOutput = moduleOutput
        self.view = view
        self.computerCounter = computerCounter
    }
    
    // MARK: - Private Methods
    
    private func compareNumbers(_ model: InputModel){
        guard let inputNumber = Int(model.input) else { return }
        guard let number = randomNumber else { return }
        
        if number == inputNumber {
            displayResult(.equals)
        }
        if number > inputNumber {
            userCounter += 1
            displayResult(.more)
        }
        if number < inputNumber {
            userCounter += 1
            displayResult(.less)
        }
    }
    
    private func displayResult(_ result: TypeOfResults) {
        switch result {
        case .equals:
            let viewModel = ResultModel(result: "Yes, that's my number")
            view?.configureResultLabels(with: viewModel)
            moduleOutput?.pushGameResultsScreen(configureCounterModel())
        case .less:
            let viewModel = ResultModel(result: "No, my number is less than yours")
            view?.configureResultLabels(with: viewModel)
            displayUserCounter(userCounter)
        case .more:
            let viewModel = ResultModel(result: "No, my number is more than yours")
            view?.configureResultLabels(with: viewModel)
            displayUserCounter(userCounter)
        }
    }
    
    private func configureCounterModel() -> CounterModel {
        let userCounter = UserCounter(count: userCounter)
        let counterModel = CounterModel(userCounter: userCounter, computerCounter: computerCounter)
        return counterModel
    }
}

// MARK: - UserIsGuesisngViewControllerOutput

extension UserIsGuesisngPresenter: UserIsGuesisngViewControllerOutput  {
    func guessButtonTapped(_ model: InputModel) {
        compareNumbers(model)
    }
    
    func displayUserCounter(_ count: Int) {
        let viewModel = UserCounter(count: count)
        view?.configureTrytLabels(with: viewModel)
    }
}

