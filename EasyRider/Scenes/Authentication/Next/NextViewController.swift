//
//  NextViewController.swift
//  Coordinatorr
//
//  Created by Salma on 16/05/2024.
//

import SwiftUI

final class NextViewController<ViewModel: NextViewModel>: UIHostingController<NextView<ViewModel>> {
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(rootView: NextView(viewModel: viewModel))
    }
    
    @MainActor
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
