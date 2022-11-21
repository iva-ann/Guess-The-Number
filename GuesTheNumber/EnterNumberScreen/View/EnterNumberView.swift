//
//  EnterNumberView.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import UIKit

class EnterNumberView: UIView {

    
    // MARK: - Constants
    
    enum Constant {
        static let topSpacing: CGFloat = 100
        static let textFieldLefrRigtSpacing: CGFloat = 30
        static let ButtonSpacing: CGFloat = 40
        static let ButtonLefrRigtSpacing: CGFloat = 25
    }
    
    // MARK: - Properties
    
    var completions: EnterNumberCompletions?
    
    private lazy var enterNumberTextField: UITextField = {
        let enterNumber = UITextField()
        enterNumber.borderStyle = .roundedRect
        enterNumber.backgroundColor = .white
        enterNumber.attributedPlaceholder = NSAttributedString(
            string: "Guess the number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray4]
        )
        enterNumber.textAlignment = .center
        return enterNumber
    }()
    
    private lazy var enterNumberButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitle("Enter the number", for: .normal)
        button.setTitleColor(.white , for: .normal)
        return button
    }()
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = .systemBackground
//        startButtonTapped(sender: startButton)
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        addSubview(enterNumberTextField)
        addSubview(enterNumberButton)
        
        enterNumberTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Constant.topSpacing)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constant.textFieldLefrRigtSpacing)
        }
        
        enterNumberButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(Constant.ButtonSpacing)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constant.ButtonLefrRigtSpacing)
        }
}
    @objc func enterNumberButtonTapped(sender: UIButton) {
        completions?.enterNumberButtonTapped()
    }
}
