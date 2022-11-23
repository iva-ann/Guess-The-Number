//
//  CoordinatorProtocol.swift
//  GuesTheNumber
//
//  Created by Анна Иванова on 23.11.2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get }
    
    func startFlow()
    func endChildFlow()
}

extension Coordinator {
    var identifier: String {
        return String(describing: self)
    }
    
    func popToRootViewController() {
        navigationController?.popToRootViewController(animated: true)
    }

    func endChildFlow() {}
}
