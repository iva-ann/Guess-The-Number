//
//  GameResultsModels.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

struct GameRessultsCompletion {
    let backToStartButtonTapped: () -> Void
}

struct CounterModel {
    let userCounter: UserCounter
    let computerCounter: ComputerCounter
}

struct GameResultModel {
    let result: String
}
