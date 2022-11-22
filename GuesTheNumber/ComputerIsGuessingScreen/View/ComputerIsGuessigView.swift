//
//  ComputerIsGuessigView.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 22.11.2022.
//

import UIKit
import SnapKit

class ComputerIsGuessigView: UIView {
    
    // MARK: - Constants
    
    enum Constant {
        static let topSpacing: CGFloat = 30
        static let headerLefrRigtSpacing: CGFloat = 30
        static let yourNumberLabelTop: CGFloat = 50
        static let buttonStackViewSpacing: CGFloat = 10
        static let headerStackViewSpacing: CGFloat = 25
        static let numberIsLabelBottom: CGFloat = -15
        static let heighWidthOfButton: CGFloat = 60
    }
    
    // MARK: - Properties
    
//    var tryCount = 1
    var guessNumber = 666
    
    private lazy var tryLabel: UILabel = {
        let label = UILabel()
        label.text = "Try № 1"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var computerIsGuessingLabel: UILabel = {
        let label = UILabel()
        label.text = "Computer is guessing"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var yourNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Your number is - \(guessNumber)"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var numberIsLabel: UILabel = {
        let label = UILabel()
        label.text = "My number is..."
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle(">", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
//        button.backgroundColor = .white
        button.setTitleColor(.black , for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var equalsButton: UIButton = {
        let button = UIButton()
        button.setTitle("=", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.black , for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
//        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var lessButton: UIButton = {
        let button = UIButton()
        button.setTitle("<", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.black , for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
//        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Constant.buttonStackViewSpacing
        return stackView
    }()
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constant.headerStackViewSpacing
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
    
    
    // MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = .systemBackground
        
        configureSubviews()
    }
    
    func configureSubviews() {
        headerStackView.snp.removeConstraints()
        buttonStackView.snp.removeConstraints()
        
        headerStackView.addArrangedSubview(tryLabel)
        headerStackView.addArrangedSubview(computerIsGuessingLabel)
        
        buttonStackView.addArrangedSubview(moreButton)
        buttonStackView.addArrangedSubview(equalsButton)
        buttonStackView.addArrangedSubview(lessButton)
        
        addSubview(headerStackView)
        addSubview(yourNumberLabel)
        addSubview(numberIsLabel)
        addSubview(buttonStackView)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Constant.topSpacing)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constant.headerLefrRigtSpacing)
        }
        
        yourNumberLabel.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(Constant.yourNumberLabelTop)
            $0.centerX.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints {
            $0.height.width.equalTo(Constant.heighWidthOfButton)
        }

        lessButton.snp.makeConstraints {
            $0.height.width.equalTo(Constant.heighWidthOfButton)
        }

        equalsButton.snp.makeConstraints {
            $0.height.width.equalTo(Constant.heighWidthOfButton)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
            $0.centerX.equalToSuperview()
        }
        
        numberIsLabel.snp.makeConstraints {
            $0.bottom.equalTo(buttonStackView.snp.top).offset(Constant.numberIsLabelBottom)
            $0.leading.equalTo(buttonStackView.snp.leading)
        }
        
    }
    
}
