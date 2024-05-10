//
//  SplashCoordinator.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation
import Coordinator

protocol SplashCoordinatorProtocol: Coordinator {
    func navigateToLogin()
}

final class SplashCoordinator: SplashCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let viewModel = SplashViewModel(coordinator: self)
        let controller = SplashViewController(viewModel: viewModel)
        router.setViewController(controller)
    }
    
    func navigateToLogin() {
        LoginCoordinator(router: router).start()
    }
}
