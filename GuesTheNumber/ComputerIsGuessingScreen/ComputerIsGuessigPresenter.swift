//
//  ComputerIsGuessigPresenter.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 22.11.2022.
//

import Foundation

protocol ComputerIsGuessigViewControllerOutput {
    func guessTheNumber(numbers: [Int], leftIndex: Int, rightIndex: Int )
    func moreButtonTapped()
    func equalsButtonTapped()
    func lessButtonTapped()
}

final class ComputerIsGuessigPresenter: ComputerIsGuessigViewControllerOutput {
    
    // MARK: - External dependencies
    
   private var computerCounter = 1
    private var arrayOfNumber = Array(1...100)
    private var midValue = 0
    private var leftIndex = 0
    private var rightIndex = 100
    
    private let moduleOutput: MainCoordinatorProtocol?
    private weak var view: ComputerIsGuessingViewControllerInput?
    
    init(moduleOutput: MainCoordinatorProtocol?, view: ComputerIsGuessingViewControllerInput?) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    // MARK: - Methods
    
    func guessTheNumber(numbers: [Int], leftIndex: Int, rightIndex: Int ){
        self.leftIndex = leftIndex
        self.rightIndex = rightIndex
        
        let midIndex = (leftIndex + rightIndex) / 2
        midValue = numbers[midIndex]
        
        displayPossibleNumber(midValue)
        displayComputerCounter(computerCounter)
    }
    
    func moreButtonTapped() {
        guessTheNumber(numbers: arrayOfNumber, leftIndex: (arrayOfNumber.firstIndex(of: midValue)! + 1), rightIndex: self.rightIndex)
        computerCounter += 1
        
    }
    
    func equalsButtonTapped() {
        let viewModel = ComputerCounter(count: computerCounter)
        moduleOutput?.pushUserIsGuesingScreen(viewModel)
    }
    
    func lessButtonTapped() {
        guessTheNumber(numbers: arrayOfNumber, leftIndex: self.leftIndex, rightIndex: (arrayOfNumber.firstIndex(of: midValue)! - 1))
        computerCounter += 1
    }
    
    func displayPossibleNumber(_ number: Int){
        let viewModel = PossibleNumberModel(number: number)
        view?.configurePossibleNumber(viewModel)
    }
    
    func displayComputerCounter(_ count: Int){
    let viewModel = ComputerCounter(count: count)
        view?.configureCounter(viewModel)
    }
}
