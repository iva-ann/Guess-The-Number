//
//  ComputerIsGuessingViewController.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 22.11.2022.
//

import UIKit

class ComputerIsGuessingViewController: UIViewController {

//    var presenter: ?
    private let contentView = ComputerIsGuessigView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        navigationItem.hidesBackButton = true
        
//        contentView.completions = EnterNumberCompletions(
//            enterNumberButtonTapped: { [weak self] in
//                self?.presenter?.enterNumberButtonTapped()
//            }
//        )
    }
}
