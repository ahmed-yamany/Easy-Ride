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
        let isSelected = item.type == viewModel.selectedItem
        ZStack {
            VStack {
                ZStack(alignment: .center) {
                    HexagonShape()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Asset.Colors.erPrimary.swiftUIColor)
                        .background(Asset.Colors.erBackground.swiftUIColor)
                    
                    Button(action: {
                        viewModel.selectedItem = item.type
                    } )
                    {
                        VStack {
                            if isSelected {
                                item.onSelectedImage
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Asset.Colors.erBackground.swiftUIColor)
                            } else {
                                item.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Asset.Colors.erBackground.swiftUIColor)
                            }
                        }
                    }
                }
                
                Text(item.title)
                   
                    .font(.custom(size: 14, weight: .bold))
                    
            }
            .foregroundStyle(isSelected ? Color(asset: Asset.Colors.erPrimary) : Color(asset: Asset.Colors.erContentDisabled))
            .frame(maxWidth: .infinity)
        }
        .background(Asset.Colors.erBackground.swiftUIColor)
    }
}

private struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let centerX = width / 2
        let centerY = height / 2
        let curveOffset = radius * 0.2 // Adjust this to control the curve size

        var path = Path()

        // Define points for hexagon vertices
        let points: [CGPoint] = (0 ..< 6).map { side in
            let angle = (CGFloat(side) * (60.0 * .pi / 180.0))
            return CGPoint(
                x: centerX + radius * cos(angle),
                y: centerY + radius * sin(angle)
            )
        }

        // Move to the first point
        path.move(to: CGPoint(
            x: points[0].x + curveOffset * cos(0),
            y: points[0].y + curveOffset * sin(0)
        ))

        // Draw lines and curves between points
        for side in 0 ..< 6 {
            let nextIndex = (side + 1) % 6
            let currentPoint = points[side]
            let nextPoint = points[nextIndex]

            let midPoint = CGPoint(
                x: (currentPoint.x + nextPoint.x) / 2,
                y: (currentPoint.y + nextPoint.y) / 2
            )

            path.addQuadCurve(to: midPoint, control: currentPoint)
            path.addQuadCurve(to: nextPoint, control: nextPoint)
        }

        path.closeSubpath()
        return path
    }
}
