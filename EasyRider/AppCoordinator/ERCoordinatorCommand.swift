//
//  ERCoordinatorCommand.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import UIKit

struct ERCoordinatorCommand: Command {
    let windowScene: UIWindowScene
    
    @MainActor
    func execute() {
        ERCoordinator.shared.makeWindow(from: windowScene)
    }
}
