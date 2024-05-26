//
//  ERButton.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 26/05/2024.
//

import SwiftUI

struct ERButton: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Asset.Colors.erBackground.swiftUIColor)
            .font(.custom(size: 16, weight: .bold))
            .frame(height: 64)
            .frame(maxWidth: .infinity)
            .background(backgroundColor(configuration))
            .mask {
                RoundedRectangle(cornerRadius: 8)
            }
            .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
    }
    
    func backgroundColor(_ configuration: Configuration) -> Color {
        if configuration.isPressed {
            return Asset.Colors.erContentDisabled.swiftUIColor
        }
        
        if !isEnabled {
            return Asset.Colors.erContentDisabled.swiftUIColor
        }
        
        return Asset.Colors.erPrimary.swiftUIColor
    }
}

extension ButtonStyle where Self == ERButton {
    static var primary: Self { ERButton() }
}
