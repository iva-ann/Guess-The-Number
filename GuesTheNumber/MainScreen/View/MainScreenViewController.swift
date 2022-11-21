//
//  MainScreenViewController.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import UIKit

//MainScreenViewControllerOut

class MainScreenViewController: UIViewController {
    
    var presenter: MainScreenViewControllerOutput?
    private let contentView = MainScreenView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        contentView.completions = MainViewCompletions(
            startButtonTapped: { [weak self] in
                self?.presenter?.startButtonTapped()
            }
        )
    }
}
