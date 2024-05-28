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
                VStack(spacing: 8) {
                    BarView(viewModel: viewModel)
                }
                .transition(.move(edge: .bottom))
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous) // Apply corner radius to the background
                        .fill(Color(asset: Asset.Colors.erBackground)) // Set the background color
                .shadow(radius: 5) // Add shadow for depth effect
                )
            }
        }
        .onAppear {
            UITabBar.appearance().isHidden = true
        }
        .animation(.easeInOut, value: viewModel.showTabBar)
        
    }
}
private struct BarView<ViewModel: TabBarViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            ForEach(viewModel.items, id: \.type) { item in
                HStack {
                    
                        BarItemView(item: item, viewModel: viewModel)
                    
                }
                .background(Color(asset: Asset.Colors.erBackground))
                
            }
        }
    }
}

private struct BarItemView<ViewModel: TabBarViewModelProtocol>: View {
    let item: any TabBarItem
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        let isSelected = item.type == viewModel.selectedItem
        Button {
            viewModel.selectedItem = item.type
        } label: {
            VStack {
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
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            
            .foregroundStyle(isSelected ? Color(asset: Asset.Colors.erPrimary) : Color(asset: Asset.Colors.erContentDisabled )
            )
            
        }
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



