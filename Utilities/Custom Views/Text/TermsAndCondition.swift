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
        Text(attributedString)
            .foregroundStyle(Asset.Colors.erContentDisabled.swiftUIColor)
            .font(.custom(size: 12, weight: .regular))
            .frame(minHeight: 44)
            .environment(\.openURL, OpenURLAction(handler: { url in
                if url.absoluteString.contains(L10n.privacy) {
                    privacyAction()
                }
                
                if url.absoluteString.contains(L10n.privacy) {
                    termsAction()
                }
                
                return .discarded
            }))
    }
    
    var attributedString: AttributedString {
        var string = AttributedString(L10n.termsAndcondition)
        
        if let privacyRange = string.range(of: L10n.privacyPolicy) {
            string[privacyRange].link = URL(string: L10n.privacy)
            string[privacyRange].underlineStyle = .single
            string[privacyRange].foregroundColor = Asset.Colors.erPrimary.color
            string[privacyRange].font = .custom(size: 12, weight: .bold)
        }
        
        if let termsRange = string.range(of: L10n.termsOfService) {
            string[termsRange].link = URL(string: L10n.terms)
            string[termsRange].underlineStyle = .single
            string[termsRange].foregroundColor = Asset.Colors.erPrimary.color
            string[termsRange].font = .custom(size: 12, weight: .bold)
        }
        
        return string
    }
}

//#Preview {
//    TermsAndCondition(privacyAction: {}, termsAction: {})
//}
