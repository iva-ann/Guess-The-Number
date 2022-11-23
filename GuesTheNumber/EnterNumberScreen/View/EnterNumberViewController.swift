//
//  EnterNumberViewController.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import UIKit

final class EnterNumberViewController: UIViewController {
    
    var presenter: EnterNumberViewControllerOutput?
    private let contentView = EnterNumberView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: - Private Methods
    
    private func initialSetup() {
        navigationItem.hidesBackButton = true
        
        contentView.completions = EnterNumberCompletions(
            enterNumberButtonTapped: { [weak self] in
                self?.presenter?.enterNumberButtonTapped()
            }
        )
    }
}
