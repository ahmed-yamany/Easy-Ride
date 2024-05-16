//
//  HomeViewController.swift
//  Coordinatorr
//
//  Created by Salma on 12/05/2024.
//

import SwiftUI

final class HomeViewController<ViewModel: HomeViewModelProtocol>: UIHostingController<HomeView<ViewModel>> {
  
  let viewModel: ViewModel
  
  init(viewModel: ViewModel) {
    self.viewModel = viewModel
    super.init(rootView: HomeView(viewModel: viewModel))
  }
  
  @MainActor
  required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

