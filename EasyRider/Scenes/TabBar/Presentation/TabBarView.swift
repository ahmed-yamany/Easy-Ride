//
//  TabBarView.swift
//  EasyRider
//
//  Created by Mahmoud on 27/05/2024.
//

import SwiftUI

struct TabBarView<ViewModel: TabBarViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selectedItem) {
                ForEach(viewModel.items, id: \.type) { item in
                    item.view.tag(item.type)
                }
            }

            if viewModel.showTabBar {
                BarView(viewModel: viewModel)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
        .onAppear {
            UITabBar.appearance().isHidden = true
        }
        .animation(.easeInOut, value: viewModel.showTabBar)
    }
}

private struct BarView<ViewModel: TabBarViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(viewModel.items, id: \.type) { item in
                    if item.style == .polygon {
                        PolygonBarItemView(item: item, viewModel: viewModel)
                    } else {
                        NormalBarItemView(item: item, viewModel: viewModel)
                    }
                }
            }
            
            VStack {}
            .frame(maxWidth: .infinity)
            .padding(.bottom, ERCoordinator.shared.window?.safeAreaInsets.bottom)
            .background(Asset.Colors.erBackground.swiftUIColor)
        }
    }
}

private struct NormalBarItemView<ViewModel: TabBarViewModelProtocol>: View {
    let item: any TabBarItem
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        let isSelected = item.type == viewModel.selectedItem
        Button {
            viewModel.selectedItem = item.type
        } label: {
            VStack(spacing: 4) {
                if isSelected {
                    item.onSelectedImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    
                } else {
                    item.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
                
                Text(item.title)
                    .font(.custom(size: 10, weight: .medium))
            }
            
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .foregroundStyle(isSelected ? Color(asset: Asset.Colors.erPrimary) : Color(asset: Asset.Colors.erContentDisabled))
            
        }
        .frame(maxWidth: .infinity)
        .background(Asset.Colors.erBackground.swiftUIColor)
    }
}

private struct PolygonBarItemView<ViewModel: TabBarViewModelProtocol>: View {
    let item: any TabBarItem
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
      Rectangle()
            .frame(width: 140, height: 140)
    }
    
}

private struct WalletBarItemView<ViewModel: TabBarViewModelProtocol>: View {
    let item: any TabBarItem // Assuming TabBarItem is the type of your items
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        // Customize appearance or behavior for the special type
        Text("Special Item")
            .foregroundColor(.blue)
    }
}
