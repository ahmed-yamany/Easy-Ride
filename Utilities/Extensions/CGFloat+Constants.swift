//
//  CGFloat+.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 26/05/2024.
//

import UIKit

@MainActor
extension CGFloat {
    static let constants = Constants()
    
    @MainActor
    struct Constants {
        let padding: CGFloat = 16
        let tabBarHeight: CGFloat = 40 + (ERCoordinator.shared.window?.safeAreaInsets.bottom ?? 200)
    }
}
