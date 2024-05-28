//
//  TabBarCoordinator.swift
//  EasyRider
//
//  Created by Mahmoud on 25/05/2024.
//

import Foundation
import Coordinator
import Combine
import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    func viewDidDisapear()
    func viewWillApear()
    func showTabBar()
    func hideTabBar()
}

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    var router: Router
    
    @Published var showHideTabBar: Bool = true
    var showTabBarPublisher: AnyPublisher< Bool, Never> {
        $showHideTabBar.eraseToAnyPublisher()
    }
    
    init(router: Router){
        self.router = router
    }
    
    func start() {
        let tabBarFactory = TabBarItemFactory(tabBarCoordinator: self)
        let useCase = TabBarUseCase(tabBarItemsFactory: tabBarFactory)
        let viewModel = TabBarViewModel(coordinator: self, useCase: useCase, showTabBarPublisher: showTabBarPublisher)
        let controller = TabBarViewController(viewModel: viewModel)
        router.setViewController(controller)
    }
    
    func viewDidDisapear() {
        router.navigationBarIsHidden = true
    }
    
    func viewWillApear() {
        router.navigationBarIsHidden = false
    }
    
    func showTabBar() {
        showHideTabBar = true
    }
    
    func hideTabBar() {
        showHideTabBar = false
    }
        
}
