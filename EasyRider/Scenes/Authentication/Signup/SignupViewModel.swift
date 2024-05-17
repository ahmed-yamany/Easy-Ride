//
//  HomeViewModel.swift
//  Coordinatorr
//
//  Created by Salma on 12/05/2024.
//

import SwiftUI

enum Gender: CaseIterable, CustomStringConvertible {
    case male, female
    
    var description: String {
        switch self {
            case .male:
                return "Male"
            case .female:
                return "Female"
        }
    }
}

@MainActor
protocol SignupViewModelProtocol: ObservableObject {
    var name: String { get set }
    var email: String { get set }
    var gender: Gender { get set }
    
    func signupTapped()
    func privacyTapped()
    func termsTapped()
}

@MainActor
final class SignupViewModel: SignupViewModelProtocol {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var gender: Gender = .male
    
    private var coordinator: SignupCoordinatorProtocol
    init(coordinator: SignupCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func signupTapped() {
        //    self.homeCoordinator.signupTapped()
    }
    
    
    func privacyTapped() {
        coordinator.navigateToPrivacy()
    }
    
    func termsTapped() {
        coordinator.navigateToTerms()
    }
}
