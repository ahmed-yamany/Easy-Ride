//
//  SocialMediaButton.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 26/05/2024.
//

import SwiftUI

struct SocialMediaButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
            .frame(width: 48, height: 48)
            .mask {
                RoundedRectangle(cornerRadius: 8)
            }
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .fill(.erContentSecondary.opacity(0.3))
            }
    }
}

extension ButtonStyle where Self == SocialMediaButtonStyle {
    static var socialMedia: Self {
        SocialMediaButtonStyle()
    }
}
