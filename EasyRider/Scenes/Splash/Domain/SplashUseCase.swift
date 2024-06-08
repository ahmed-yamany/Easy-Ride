//
//  SplashUseCase.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 08/06/2024.
//

import Foundation

protocol SplashUseCaseProtocol {
    func getSplashes() async throws -> [SplashModel]
}

final class SplashUseCase: SplashUseCaseProtocol {
    func getSplashes() async throws -> [SplashModel] {
        [
            SplashModel(
                image: "onBoarding1",
                title: "Anywhere you are",
                descreption: "Sell houses easily with the help of Listenoryx and to make this line big I am writing more."
            ),
            SplashModel(
                image: "onBoarding2",
                title: "At anytime",
                descreption: "Sell houses easily with the help of Listenoryx and to make this line big I am writing more."
            ),
            SplashModel(
                image: "onBoarding3",
                title: "Book your car",
                descreption: "Sell houses easily with the help of Listenoryx and to make this line big I am writing more."
            )
        ]
    }
}
