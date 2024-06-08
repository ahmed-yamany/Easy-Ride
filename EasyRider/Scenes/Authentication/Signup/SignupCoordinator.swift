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
    func navigateToSignIn()
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
        SignupCoordinator(router: router).start()
    }
    
    func navigateToTerms() {
        
    }
    
    func navigateToPrivacy() {
        
    }
    
    func navigateToSignIn() {
        LoginCoordinator(router: router).start()
    }
}
