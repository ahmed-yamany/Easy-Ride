//
//  TabBarFactory.swift
//  EasyRider
//
//  Created by Mahmoud on 21/05/2024.
//

import SwiftUI

@MainActor
protocol TabBarItemAbstractFactory {
    func make() -> any TabBarItem
}

struct HomeTabBarFactory: TabBarItemAbstractFactory {
    func make() -> any TabBarItem {
//        let navigationContoller = UINavigationController()
//        let router = ERRouter(navigationController: navigationContoller)
//        let coordinator =
        
        let view = ScrollView {
            LazyVStack {
                ForEach(0..<100, id: \.self) { index in
                    Text("hello hello hello hello hello \(index)")
                        .onTapGesture {
                            print("helo \(index)")
                        }
                }
            }
        }
        return HomeBarItem(view: AnyView(view))
    }
}
struct FavouriateTabBarFactory: TabBarItemAbstractFactory {
    func make() -> any TabBarItem {
        return FavouriteBarItem(view: Text("Hello Favouriate").eraseToAnyView())
    }
}
struct OfferTabBarFactory: TabBarItemAbstractFactory {
    func make() -> any TabBarItem {
        return OfferBarItem(view: Text("Hello Offer").eraseToAnyView())
    }
}

struct WalletTabBarFactory: TabBarItemAbstractFactory {
    func make() -> any TabBarItem {
        return WalletBarItem(view: AnyView(Text("Hello Wallet")))
    }
}
struct ProfileTabBarFactory: TabBarItemAbstractFactory {
    func make() -> any TabBarItem {
        return ProfileBarItem(view: Text("Hello Profile").eraseToAnyView())
    }
}
public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

@MainActor
struct TabBarItemFactory {
    let tabBarCoordinator: TabBarCoordinatorProtocol
    func make(for type: TabBarType) -> any TabBarItem {
        switch type {
        
        case .home:
            return HomeTabBarFactory().make()
        case .favourite:
            return FavouriateTabBarFactory().make()
        case .wallet:
            return WalletTabBarFactory().make()
        case .offer:
            return OfferTabBarFactory().make()
        case .profile:
            return ProfileTabBarFactory().make()
        }
    }
}
