//
//  HomeView.swift
//  Coordinatorr
//
//  Created by Salma on 12/05/2024.
//

import SwiftUI

struct SignupView<ViewModel: SignupViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selectedOption: String = ""
            
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                headerView
                
                VStack(spacing: 20) {
                    ERTextField(placeholder: L10n.name, text: $viewModel.name)
                    ERTextField(placeholder: L10n.email, text: $viewModel.email)
                    
                    DropDownTextField(items: Gender.allCases, text: $viewModel.gender, placeholder: L10n.gender)
                }
                
                VStack(spacing: 16) {
                    TermsAndCondition(privacyAction: viewModel.privacyTapped, termsAction: viewModel.termsTapped)
                    
                    Button(L10n.signup) {
                        viewModel.signupTapped()
                    }
                    .buttonStyle(ERButton())
                    
                    ORDivider()
                }
                
                HStack(spacing: 16) {
                    Button {
                        
                    } label: {
                        Asset.Assets.gmail.swiftUIImage
                            .resizable()
                    }
                    .buttonStyle(.socialMedia)
                    
                    Button {
                        
                    } label: {
                        Asset.Assets.facebook.swiftUIImage
                            .resizable()
                    }
                    .buttonStyle(.socialMedia)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "apple.logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(6)
                            .foregroundStyle(.erBackground)
                            .background(.black)
                            .mask {
                                Circle()
                            }
                    }
                    .buttonStyle(.socialMedia)
                }
                
                HStack {
                    Text(L10n.haveAccount)
                        .foregroundColor(.gray)
                    
                    Button(L10n.signin) {
                        viewModel.signInTapped()
                    }
                    .foregroundColor(.yellow)
                    .font(.custom(size: 16, weight: .medium))
                }
            }
            .padding(.horizontal, .constants.padding)
        }
    }
    
    private var headerView: some View {
        Text(L10n.signup)
            .font(.system(size: 24, weight: .medium))
            .padding(.bottom, 16)
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct ORDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .overlay {
                Text(L10n.or)
                    .padding(.horizontal, 4)
                    .background(.erBackground)
            }
            .foregroundStyle(.erContentDisabled)
            .font(.custom(size: 12, weight: .medium))
    }
}
