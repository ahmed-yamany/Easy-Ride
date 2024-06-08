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
    func showOnboarding()
    func showAuthentication()
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
    
    func showOnboarding() {
        router.reset()
        router.setNavigationBarHidden(true, animated: false)
        SplashCoordinator(router: router).start()
    }
    
    func showAuthentication() {
        router.reset()
        router.setNavigationBarHidden(false, animated: false)
        SignupCoordinator(router: router).start()
    }
    
    func showTabBar() {
        router.reset()
        router.setNavigationBarHidden(true, animated: false)
        TabBarCoordinator(router: router).start()
    }
    
}
