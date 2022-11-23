//
//  ComputerIsGuessingViewController.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 22.11.2022.
//

import UIKit

protocol ComputerIsGuessingViewControllerInput: AnyObject {
    func configurePossibleNumber(_ model: PossibleNumberModel)
    func configureCounter(_ model: ComputerCounter)
}

class ComputerIsGuessingViewController: UIViewController, ComputerIsGuessingViewControllerInput {

    var presenter: ComputerIsGuessigViewControllerOutput?
    private let contentView = ComputerIsGuessigView()
    private let arrayOfNumbers = Array(1...100)

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        presenter?.guessTheNumber(numbers: arrayOfNumbers, leftIndex: arrayOfNumbers.startIndex, rightIndex: (arrayOfNumbers.count - 1))

    }
    
    func configurePossibleNumber(_ model: PossibleNumberModel) {
        contentView.configurePossibleNumber(with: model)
    }
    
    func configureCounter(_ model: ComputerCounter){
        contentView.configureCounter(with: model)
    }
                                  
    func initialSetup() {
        navigationItem.hidesBackButton = true
        
        contentView.completions = ButtonCompletions(
            moreButtonTapped: { [weak self] in
                self?.presenter?.moreButtonTapped()
            },
            equalsButtonTapped: { [weak self] in
                self?.presenter?.equalsButtonTapped()
            },
            lessButtonTapped: { [weak self] in
                self?.presenter?.lessButtonTapped()
            }
        )
    }
}
