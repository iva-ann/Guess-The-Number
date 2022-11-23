//
//  UserIsGuesisngViewController.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import UIKit

protocol UserIsGuesisngViewControllerInput: AnyObject {
    func configureResultLabels(with model: ResultModel)
    func configureTrytLabels(with model: UserCounter)
}

final class UserIsGuesisngViewController: UIViewController {
    
    var presenter: UserIsGuesisngViewControllerOutput?
    private let contentView = UserIsGuesisngView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        navigationItem.hidesBackButton = true
        
        contentView.completions = GuessNumberCompletions(
            guessButtonTapped: { [weak self] model in
                self?.presenter?.guessButtonTapped(model)
        })
    }
}

extension UserIsGuesisngViewController: UserIsGuesisngViewControllerInput {
    func configureResultLabels(with model: ResultModel) {
        contentView.configureResultLabels(with: model)
    }
    
    func configureTrytLabels(with model: UserCounter) {
        contentView.configureCounter(with: model)
    }
}
