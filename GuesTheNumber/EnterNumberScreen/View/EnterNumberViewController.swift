//
//  EnterNumberViewController.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import UIKit

class EnterNumberViewController: UIViewController, UITextFieldDelegate {
    
    var presenter: EnterNumberViewControllerOutput?
    private let contentView = EnterNumberView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        navigationItem.hidesBackButton = true
        
        contentView.completions = EnterNumberCompletions(
            enterNumberButtonTapped: { [weak self] in
                self?.presenter?.enterNumberButtonTapped()
            }
        )
    }
}
