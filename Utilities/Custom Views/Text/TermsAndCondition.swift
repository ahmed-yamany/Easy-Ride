//
//  TermsAndCondition.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 18/05/2024.
//

import SwiftUI

typealias Action = () -> Void

struct TermsAndCondition: View {
    let privacyAction: Action
    let termsAction: Action
    
    var body: some View {
        Text("\(L10n.termsAndCondition) \(termsOfService) \(L10n.and) \(privacyPolicy)")
            .foregroundStyle(Asset.Colors.erContentDisabled.swiftUIColor)
            .font(.custom(size: 12, weight: .regular))
            .environment(\.openURL, OpenURLAction(handler: { url in
                if url.absoluteString.contains(L10n.privacy) {
                    privacyAction()
                }
                
                if url.absoluteString.contains(L10n.privacy) {
                    termsAction()
                }
                
                return .discarded
            }))
            .multilineTextAlignment(.leading)
    }
    
    var termsOfService: AttributedString {
        var result = AttributedString(L10n.termsOfService)
        result.font = .custom(size: 12, weight: .bold)
        result.foregroundColor = Asset.Colors.erPrimary.color
        result.link = URL(string: L10n.terms)
        return result
    }
    
    var privacyPolicy: AttributedString {
        var result = AttributedString(L10n.privacyPolicy)
        result.font = .custom(size: 12, weight: .bold)
        result.foregroundColor = Asset.Colors.erPrimary.color
        result.link = URL(string: L10n.privacy)
        return result
    }
}

//#Preview {
//    TermsAndCondition(privacyAction: {}, termsAction: {})
//}
