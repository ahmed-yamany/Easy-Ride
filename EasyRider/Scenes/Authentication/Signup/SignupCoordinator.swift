//
//  HomeCoordinator.swift
//  Coordinatorr
//
//  Created by Salma on 12/05/2024.
//

import Foundation
import Coordinator

protocol SignupCoordinatorProtocol: Coordinator {
    func navigateToPrivacy()
    func navigateToTerms()
}

final class SignupCoordinator: SignupCoordinatorProtocol {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let viewModel = SignupViewModel(coordinator: self)
        let controller = SignupViewController(viewModel: viewModel)
        router.setViewController(controller)
    }
    
    func signupTapped() {
        NextCoordinator(router: router).start()
    }
    
    func navigateToTerms() {
        
    }
    
    func navigateToPrivacy() {
        
    }
}
