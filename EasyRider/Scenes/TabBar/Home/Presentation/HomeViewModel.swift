//
//  HomeViewModel.swift
//  EasyRider
//
//  Created by Mahmoud on 09/07/2024.
//

import Combine
import SwiftUI

@MainActor
protocol HomeViewModelProtocol: ObservableObject {
    
}

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
    private let coordinator: HomeCoordinatorProtocol
    private let useCase: HomeUseCaseProtocol
    
    init(coordinator: HomeCoordinatorProtocol, useCase: HomeUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
       
    }
}
