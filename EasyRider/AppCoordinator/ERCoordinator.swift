//
//  ERCoordinator.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import UIKit
import Coordinator

protocol ERCoordinatorProtocol: Coordinator {
    func makeWindow(from windowScene: UIWindowScene)
    func showSplash()
    func showOnboarding()
    func showTabBar()
}

final class ERCoordinator: ERCoordinatorProtocol {
    static let shared: ERCoordinatorProtocol = ERCoordinator()
    
    var router: Router
    var window: UIWindow?
    
    private init() {
        let navigationController = UINavigationController()
        self.router = ERRouter(navigationController: navigationController)
    }
    
    func makeWindow(from windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = router.navigationController
        window.makeKeyAndVisible()
        start()
        self.window = window
    }
    
    func start() {
//        showOnboarding()
        SignupCoordinator(router: router).start()
    }
    
    func showSplash() {
        
    }
    
    func showOnboarding() {
        let coordinator = SplashCoordinator(router: router)
        coordinator.start()
    }
    
    func showTabBar() {
//        showSplash()
    }
    
}
