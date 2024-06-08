//
//  SplashViewModel.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation

@MainActor
protocol SplashViewModelProtocol: ObservableObject {
    var models: [SplashModel] { get set }
    var currentStep: Int { get set }
    
    func progressValue() -> CGFloat
    func onAppear()
    func skipTapped()
    func nextTapped()
}

@MainActor
final class SplashViewModel: SplashViewModelProtocol {
    @Published var models: [SplashModel] = []
    @Published var currentStep: Int = 0

    let coordinator: SplashCoordinatorProtocol
    let useCase: SplashUseCaseProtocol
    
    init(coordinator: SplashCoordinatorProtocol, useCase: SplashUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func onAppear() {
        Task {
            do {
                models = try await useCase.getSplashes()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func progressValue() -> CGFloat {
        if models.isEmpty {
            return 0
        }
    
        return CGFloat(currentStep + 1)/CGFloat(models.count)
    }
    
    func skipTapped() {
        coordinator.navigateToLogin()
    }
    
    func nextTapped() {
        if currentStep < models.count - 1 {
            currentStep += 1
        } else {
            skipTapped()
        }
    }
}
