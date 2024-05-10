//
//  LoginViewModel.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI

@MainActor
protocol LoginViewModelProtocol: ObservableObject {}

@MainActor
final class LoginViewModel: LoginViewModelProtocol {
    
    private let coordinator: LoginCoordinatorProtocol
    private let useCase: LoginUseCaseProtocol
    
    init(coordinator: LoginCoordinatorProtocol, useCase: LoginUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
}
