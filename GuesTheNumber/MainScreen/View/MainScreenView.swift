//
//  MainScreenView.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 21.11.2022.
//

import UIKit
import SnapKit

final class MainScreenView: UIView {
    
    // MARK: - Constants
    
    enum Constant {
        static let topSpacing: CGFloat = 100
        static let textLefrRigtSpacing: CGFloat = 30
        static let startButtonSpacing: CGFloat = 40
        static let startButtonLefrRigtSpacing: CGFloat = 25
    }
    
    // MARK: - Properties
    
    var completions: MainViewCompletions?
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Me Awesome Game"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var startButton: UIButton = {
       let button = UIButton()
        button.setTitle("Start New Game", for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
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
        startButtonTapped(sender: startButton)
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        addSubview(textLabel)
        addSubview(startButton)
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Constant.topSpacing)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constant.textLefrRigtSpacing)
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(Constant.startButtonSpacing)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Constant.startButtonLefrRigtSpacing)
        }
    }
    
    // MARK: - Actions
    @objc func startButtonTapped(sender: UIButton){
        completions?.startButtonTapped()
    }
}
