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
            onBoardingView
            Spacer()
            progressButton
        }
        .animation(.easeIn(duration: 0.3), value: viewModel.currentStep)
        .onAppear {
            viewModel.onAppear()
        }
    }

    var onBoardingView: some View {
        VStack {
            skipButton
            tabView
        }
    }

    var skipButton: some View {
        Button {
            viewModel.skipTapped()
        } label: {
            Text(L10n.skip)
                .foregroundStyle(Asset.Colors.erContentPrimary.swiftUIColor)
                .font(.custom(size: 16, weight: .regular))
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.horizontal, 16)
    }

    private var tabView: some View {
        TabView(selection: $viewModel.currentStep) {
            ForEach(0 ..< viewModel.models.count, id: \.self) { index in
                let model = viewModel.models[index]
                VStack(spacing: 44) {
                    Image(model.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 220)
                    VStack(spacing: 12) {
                        Text(model.title)
                            .font(.custom(size: 24, weight: .regular))
                        Text(model.descreption)
                            .font(.custom(size: 14, weight: .regular))
                            .padding(.horizontal, 30)
                    }
                    .foregroundStyle(Asset.Colors.erContentPrimary.swiftUIColor)
                }
                .tag(index)
                .padding(.horizontal, CGFloat.constants.padding)
                .frame(maxWidth: .infinity)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    var progressButton: some View {
        ZStack {
            ProgressBar(value: viewModel.progressValue(), color: Asset.Colors.erPrimary.swiftUIColor)
                .frame(width: 80, height: 80)

            Button {
                viewModel.nextTapped()
            } label: {
                Image(systemName: "arrow.right")
                    .frame(width: 65, height: 65, alignment: .center)
                    .background(Asset.Colors.erPrimary.swiftUIColor)
                    .tint(Color.gray)
                    .clipShape(Circle())
            }
        }
        .padding(.bottom, 50)
        .padding(.top, 150)
    }
}

struct ProgressBar: View {
    let value: CGFloat
    let color: Color

    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .opacity(0.3)
            .foregroundColor(.yellow)

        Circle()
            .trim(from: 0, to: CGFloat(value))
            .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
            .foregroundColor(color)
            .rotationEffect(Angle(degrees: 270))
    }
}

// #Preview {
//    let coordiantor = SplashCoordinator(router: .init(navigationController: .init()))
//    let viewModel = SplashViewModel(coordinator: coordiantor, useCase: SplashUseCase())
//    return SplashView(viewModel: viewModel)
// }
