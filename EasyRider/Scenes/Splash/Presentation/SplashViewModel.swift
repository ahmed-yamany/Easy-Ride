//
//  SplashViewModel.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation

@MainActor
protocol SplashViewModelProtocol: ObservableObject {
    func loginButtonTapped()
}

@MainActor
final class SplashViewModel: SplashViewModelProtocol {
    
    let coordinator: SplashCoordinatorProtocol
    init(coordinator: SplashCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func loginButtonTapped() {
        coordinator.navigateToLogin()
    }
}
