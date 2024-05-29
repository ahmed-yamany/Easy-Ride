//
//  ERCoordinator.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import UIKit
import Coordinator

protocol ERCoordinatorProtocol: Coordinator {
    var window: UIWindow? { get set }
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
       showOnboarding()
    }
    
    func showSplash() {
        
    }
    
    func showOnboarding() {
        router.navigationController.navigationBar.isHidden = true
        let coordinator = SplashCoordinator(router: router)
        coordinator.start()
    }
    
    func showTabBar() {
        router.reset()
        TabBarCoordinator(router: router).start()
    }
    
}
