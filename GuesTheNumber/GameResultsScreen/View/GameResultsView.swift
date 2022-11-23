//
//  GameResultsView.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import UIKit

final class GameResultsView: UIView {
    
    // MARK: - Constants
    
    enum Constant {
        static let topSpacing: CGFloat = 20
        static let stackViewSpacing: CGFloat = 15
        static let scoresLabelSpacing: CGFloat = 60
        static let leadingTrailingSpasing: CGFloat = 25
        static let bottomSpacing: CGFloat = -40
        static let backButtonSpacing: CGFloat = -40
        
        static let mainStackViewSpacing: CGFloat = 35
        static let mainSVLeftRightSpacing: CGFloat = 30
        static let heighOfResultLabel: CGFloat = 30
    }
    
    // MARK: - Properties
    
    var completions: GameRessultsCompletion?

    private lazy var scoresLabel: UILabel = {
        let label = UILabel()
        label.text = "Scores:"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var computerCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var scoresStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
//        stackView.alignment = .leading
        stackView.spacing = Constant.stackViewSpacing
        return stackView
    }()
    
    private lazy var gameResultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var backToStartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitle("Main menu", for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.addTarget(self, action: #selector(backToStartButtonTapped), for: .touchUpInside)
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
    
    // MARK: - Public Methods
    
    func configureScoreLabels(with model: CounterModel) {
        userCountLabel.text = "Your's tries count: \(model.userCounter.count)"
        computerCountLabel.text = "Computers's tries count: \(model.computerCounter.count)"
    }
    
    func configureGameResult(with model: ResultModel){
        gameResultLabel.text = model.result
    }
    
    // MARK: - Private Methods
    
    private func initialSetup() {
        backgroundColor = .systemBackground
        configureSubviews()
    }
    
    private func configureSubviews() {
        scoresStackView.addArrangedSubview(userCountLabel)
        scoresStackView.addArrangedSubview(computerCountLabel)
        
        addSubview(scoresLabel)
        addSubview(scoresStackView)
        addSubview(gameResultLabel)
        addSubview(backToStartButton)
        
        scoresLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Constant.topSpacing)
            $0.centerX.equalToSuperview()
        }
        
        scoresStackView.snp.makeConstraints {
            $0.top.equalTo(scoresLabel.snp.bottom).offset(Constant.scoresLabelSpacing)
            $0.leading.equalToSuperview().offset(Constant.leadingTrailingSpasing)
        }
        
        backToStartButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(Constant.bottomSpacing)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constant.leadingTrailingSpasing)
        }
        
        gameResultLabel.snp.makeConstraints {
            $0.bottom.equalTo(backToStartButton.snp.top).offset(Constant.backButtonSpacing)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc func backToStartButtonTapped() {
        completions?.backToStartButtonTapped()
    }
}
