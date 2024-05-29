//
//  SplashViewModel.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import Foundation

@MainActor
protocol SplashViewModelProtocol: ObservableObject {
    func loginButtonTapped()
    func getSplashData()->[SplashModel]
}

@MainActor
final class SplashViewModel: SplashViewModelProtocol {
    
    let coordinator: SplashCoordinatorProtocol
    
    private let onboardingData = [
        SplashModel(image: "onBoarding1" , title:  "Anywhere you are", descreption: "Sell houses easily with the help of Listenoryx and to make this line big I am writing more."),
        SplashModel(image: "onBoarding2", title: "At anytime", descreption: "Sell houses easily with the help of Listenoryx and to make this line big I am writing more."),
        SplashModel(image: "onBoarding3", title: "Book your car", descreption: "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.")
    ]
    
    init(coordinator: SplashCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func loginButtonTapped() {
        coordinator.navigateToLogin()
    }
    
    func getSplashData()->[SplashModel]{
        return onboardingData
    }
}
