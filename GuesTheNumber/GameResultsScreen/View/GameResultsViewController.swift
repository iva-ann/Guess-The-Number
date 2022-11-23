//
//  GameResultsViewController.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import UIKit

protocol GameResultsViewControllerInput: AnyObject {
    func configureScoreLabels(_ model: CounterModel)
    func configureResultLabel(_ model: ResultModel)
}

final class GameResultsViewController: UIViewController {
    
    var presenter: GameResultsViewControllerOutput?
    private let contentView = GameResultsView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        presenter?.displayResult()
        presenter?.displayCommonScores()
    }
    
    // MARK: - Private Methods
    
    private func initialSetup() {
        navigationItem.hidesBackButton = true
        
        contentView.completions = GameRessultsCompletion(
            backToStartButtonTapped: { [weak self] in
                self?.presenter?.backToStartButtonTapped()
            })
    }
}

// MARK: - GameResultsViewControllerInput

extension GameResultsViewController: GameResultsViewControllerInput {
    func configureScoreLabels(_ model: CounterModel) {
        contentView.configureScoreLabels(with: model)
    }
    
    func configureResultLabel(_ model: ResultModel) {
        contentView.configureGameResult(with: model)
    }
}
