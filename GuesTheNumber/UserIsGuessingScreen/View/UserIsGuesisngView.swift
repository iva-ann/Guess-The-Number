//
//  UserIsGuessingScreenView.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import UIKit
import SnapKit

class UserIsGuesisngView: UIView {
    
    // MARK: - Constants
    
    enum Constant {
        static let topSpacing: CGFloat = 30
        static let headerStackViewSpacing: CGFloat = 25
        static let mainStackViewSpacing: CGFloat = 35
        static let bottomSpacing: CGFloat = -20
        static let mainSVLeftRightSpacing: CGFloat = 30
        static let heighOfResultLabel: CGFloat = 30
    }
    
    // MARK: - Properties
    
    var completions: GuessNumberCompletions?
    
    private lazy var tryLabel: UILabel = {
        let label = UILabel()
        label.text = "Try № 1"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userIsGuessingLabel: UILabel = {
        let label = UILabel()
        label.text = "You are guessing"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constant.headerStackViewSpacing
        return stackView
    }()
    
    private lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter the number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray4]
        )
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var guessButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitle("Gues", for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constant.mainStackViewSpacing
        return stackView
    }()
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configureResultLabels(with model: ResultModel) {
        resultLabel.text = model.result
    }
    
    func configureCounter(with model: UserCounter) {
        let count = model.count
        guard count != nil else { return }
        tryLabel.text = "Try № \(count)"
    }
    
    // MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = .systemBackground
        inputTextField.delegate = self
        inputTextField.keyboardType = .numberPad
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        headerStackView.addArrangedSubview(tryLabel)
        headerStackView.addArrangedSubview(userIsGuessingLabel)
        
        mainStackView.addArrangedSubview(inputTextField)
        mainStackView.addArrangedSubview(guessButton)
        mainStackView.addArrangedSubview(resultLabel)
        
        addSubview(headerStackView)
        addSubview(mainStackView)
        
        resultLabel.snp.makeConstraints {
            $0.height.equalTo(Constant.heighOfResultLabel)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Constant.topSpacing)
            $0.centerX.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(Constant.bottomSpacing)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constant.mainSVLeftRightSpacing)
        }
    }
    
    // MARK: - Actions
    @objc func guessButtonTapped() {
        guard let input = inputTextField.text else { return }
        let viewModel = InputModel(input: input)
        completions?.guessButtonTapped(viewModel)
    }
}

extension UserIsGuesisngView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)

        let text = (inputTextField.text! as NSString).replacingCharacters(in: range, with: string)
    if text.isEmpty {
        return true
    } else if let num = Int(text), num >= 1 && num <= 100 {
        return allowedCharacters.isSuperset(of: characterSet)
    } else {
        return false
    }
    }
}
    
    
