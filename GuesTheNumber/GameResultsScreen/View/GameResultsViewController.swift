//
//  GameResultsViewController.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import UIKit
protocol GameResultsViewControllerInput: AnyObject {
    func configureLabels(_ model: CounterModel)
}

class GameResultsViewController: UIViewController {
    
    private var presenter: GameResultsViewControllerOutput?
    private let contentView = GameResultsView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        initialSetup()
    }

}
