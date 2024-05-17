//
//  HomeView.swift
//  Coordinatorr
//
//  Created by Salma on 12/05/2024.
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

struct SignupView<ViewModel: SignupViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selectedOption: String = ""
        
    let gender = ["Female", "Male"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                headerView
                
                VStack(spacing: 20) {
                    ERTextField(placeholder: "Name", text: $viewModel.name)
                    ERTextField(placeholder: "Email", text: $viewModel.email)
                    
                    DropDownTextField(items: Gender.allCases, text: $viewModel.gender, placeholder: "Gender")
                }
                
                TermsAndCondition(privacyAction: viewModel.privacyTapped, termsAction: viewModel.termsTapped)
                
                Button  {
                    
                } label: {
                    Image(systemName: "house")
                }
                .buttonStyle(.primary)

                
                Button(L10n.signup) {
                    viewModel.signupTapped()
                }
                .buttonStyle(ERButton())
                
                Text("───────── or ─────────")
                    .foregroundColor(.gray)
                    .padding(.top, 15)
                
                HStack{
                    Button(action: {
                        
                    }) {
                        Image("gmail")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 32, height: 32)
                    }
                    .frame(width: 50, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(.trailing, 8)
                    
                    Button(action: {
                        
                    }) {
                        Image("facebook")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 32, height: 32)
                    }
                    .frame(width: 50, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(.trailing, 8)
                    
                    Button(action: {
                        
                    }) {
                        Image("apple")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 32, height: 32)
                    }
                    .frame(width: 50, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                }.padding(.top, 20)
                
                HStack{
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    Button("Sign in"){
                        
                    }
                    .foregroundColor(.yellow)
                    .font(.system(size: 16, weight: .medium))
                }.padding(.top, 20)
            }
            .padding(.horizontal, 20)
        }
        
    }
    
    private var headerView: some View {
        Text("Sign up")
            .font(.system(size: 24, weight: .medium))
            .padding(.bottom, 16)
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
