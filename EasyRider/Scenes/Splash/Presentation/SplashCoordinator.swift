//
//  SplashCoordinator.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation

protocol SplashCoordinatorProtocol: Coordinator {
    
}

final class SplashCoordinator: SplashCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let viewModel = SplashViewModel()
        let controller = SplashViewController(viewModel: viewModel)
        router.setViewController(controller)
    }
}
