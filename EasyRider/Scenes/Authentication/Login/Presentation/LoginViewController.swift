//
//  LoginViewController.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI

final class LoginViewController<ViewModel: LoginViewModelProtocol>: UIHostingController<LoginView<ViewModel>> {
    
    init(viewModel: ViewModel) {
        super.init(rootView: LoginView(viewModel: viewModel))
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
