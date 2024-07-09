//
//  TabBarViewController.swift
//  EasyRider
//
//  Created by Mahmoud on 27/05/2024.
//

import SwiftUI

final class TabBarViewController<ViewModel: TabBarViewModelProtocol>: UIHostingController<TabBarView<ViewModel>> {
    
    let viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(rootView: TabBarView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisAppear()
    }
}
