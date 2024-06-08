//
//  SplashViewController.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import SwiftUI

final class SplashViewController<ViewModel: SplashViewModelProtocol>: UIHostingController<SplashView<ViewModel>> {
    
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(rootView: SplashView(viewModel: viewModel))
    }
    
    @MainActor
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}
