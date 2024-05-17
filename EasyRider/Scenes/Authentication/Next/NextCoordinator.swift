//
//  NextCoordinator.swift
//  Coordinatorr
//
//  Created by Salma on 16/05/2024.
//

import Foundation
import Coordinator

protocol NextCoordinatorProtocol: Coordinator {
    func tappedButton()
}
class NextCoordinator: NextCoordinatorProtocol {
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let viewModel = NextViewModel()
        let controller = NextViewController(viewModel: viewModel)
        router.present(controller)
    }
    
    func tappedButton() {
        router.dismiss()
    }
    
}
