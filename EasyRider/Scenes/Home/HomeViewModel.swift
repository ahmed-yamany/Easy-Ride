//
//  HomeViewModel.swift
//  Coordinatorr
//
//  Created by Salma on 12/05/2024.
//

import Foundation
protocol HomeViewModelProtocol: ObservableObject {
  func SignupTapped()
}

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
  private var homeCoordinator: HomeCoordinator
  init(homeCoordinator: HomeCoordinator) {
    self.homeCoordinator = homeCoordinator
  }
  
  func SignupTapped() {
    self.homeCoordinator.signupTapped()
  }
  
}
