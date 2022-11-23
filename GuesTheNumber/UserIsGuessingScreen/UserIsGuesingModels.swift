//
//  UserIsGuesingModel.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

struct GuessNumberCompletions {
    let guessButtonTapped: (_ model: InputModel) -> Void
}

struct InputModel {
    let input: String
}

struct ResultModel {
    let result: String 
}

struct UserCounter {
    let count: Int
}

enum TypeOfResults {
    case equals
    case less
    case more
}
