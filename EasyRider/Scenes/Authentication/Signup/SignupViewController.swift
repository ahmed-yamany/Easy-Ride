//
//  HomeViewController.swift
//  Coordinatorr
//
//  Created by Salma on 12/05/2024.
//

import SwiftUI

final class SignupViewController<ViewModel: SignupViewModelProtocol>: UIHostingController<SignupView<ViewModel>> {
  
  let viewModel: ViewModel
  
  init(viewModel: ViewModel) {
    self.viewModel = viewModel
    super.init(rootView: SignupView(viewModel: viewModel))
  }
  
  @MainActor
  required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
