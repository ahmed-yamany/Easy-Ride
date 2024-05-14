//
//  SplashView.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import SwiftUI

struct SplashView<ViewModel: SplashViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .background(Asset.Colors.erBackground.swiftUIColor)
    }
}
