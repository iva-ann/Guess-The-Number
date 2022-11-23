//
//  GameStartViewController.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import UIKit

//MainScreenViewControllerOut

class GameStartViewController: UIViewController {
    
    var presenter: GameStartScreenViewControllerOutput?
    private let contentView = GameStartView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        contentView.completions = GameStarCompletions(
            startButtonTapped: { [weak self] in
                self?.presenter?.startButtonTapped()
            }
        )
    }
}
