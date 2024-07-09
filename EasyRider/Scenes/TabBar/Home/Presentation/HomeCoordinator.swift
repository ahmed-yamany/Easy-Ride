//
//  HomeCoordinator.swift
//  EasyRider
//
//  Created by Mahmoud on 09/07/2024.
//

import Foundation
import Coordinator
import Combine
import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
    
}

final class HomeCoordinator: HomeCoordinatorProtocol {
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        
    }
}
