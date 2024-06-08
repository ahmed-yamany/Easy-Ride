//
//  LoginView.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Hello World!")
        }
    }
}
