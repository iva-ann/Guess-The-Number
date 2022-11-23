//
//  ComputerIsGuessingModels.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 22.11.2022.
//

import UIKit

struct ButtonCompletions {
    let moreButtonTapped: () -> Void
    let equalsButtonTapped: () -> Void
    let lessButtonTapped: () -> Void
}

struct ComputerCounter {
    var count: Int
}

struct PossibleNumberModel {
    var number: Int
}
