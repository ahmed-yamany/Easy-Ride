//
//  LoginCoordinator.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import Foundation
import Coordinator

protocol LoginCoordinatorProtocol: Coordinator {
}

final class LoginCoordinator: LoginCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let useCase = LoginUseCase()
        let viewModel = LoginViewModel(coordinator: self, useCase: useCase)
        let controller = LoginViewController(viewModel: viewModel)
        router.push(controller)
    }
}
