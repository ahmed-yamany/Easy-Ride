//
//  HomeCoordinator.swift
//  Coordinatorr
//
//  Created by Salma on 12/05/2024.
//

import Foundation

protocol HomeCoordinatorProtocol: Coordinator {
  
}

final class HomeCoordinator: HomeCoordinatorProtocol {
  let router: Router
  
  init(router: Router) {
    self.router = router
  }
  
  func start() {
    let viewModel = HomeViewModel(homeCoordinator: self)
    let controller = HomeViewController(viewModel: viewModel)
    router.setViewController(controller)
  }
  
  func signupTapped() {
    NextCoordinator(router: router).start()
  }
}
