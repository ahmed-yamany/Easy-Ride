//
//  TabBarItem.swift
//  EasyRider
//
//  Created by Mahmoud on 20/05/2024.
//

import SwiftUI

enum TabBarItemStyle: Hashable {
    case normal
    case polygon
}

enum TabBarType: Hashable, CaseIterable {
    case home
    case favourite
    case wallet
    case offer
    case profile
}

protocol TabBarItem: Identifiable {
    var title: String { get }
    var type: TabBarType { get }
    var style: TabBarItemStyle { get}
    var image: Image { get }
    var view: AnyView { get }
    var onSelectedImage: Image { get }
}

struct HomeBarItem: TabBarItem {
    var id: UUID = UUID()
    var title: String = "Home"
    var type: TabBarType = .home
    var style: TabBarItemStyle = .normal
    var image: Image = Image(systemName: "house")
    var onSelectedImage: Image = Image(systemName: "house.fill")
    var view: AnyView
}

struct FavouriteBarItem: TabBarItem {
    var id: UUID = UUID()
    var title: String = "Favouriate"
    var type: TabBarType = .favourite
    var style: TabBarItemStyle = .normal
    var image: Image = Image(systemName: "heart")
    var onSelectedImage: Image  = Image(systemName: "heart.fill")
    var view: AnyView
}

struct WalletBarItem: TabBarItem {
    var id: UUID = UUID()
    var title: String = "Wallet"
    var type: TabBarType = .wallet
    var image: Image = Image(systemName: "star")
    var style: TabBarItemStyle = .polygon
    var onSelectedImage: Image = Image(systemName: "star.fill")
    var view: AnyView
}

struct OfferBarItem: TabBarItem {
    var id: UUID = UUID()
    var title: String = "Offer"
    var type: TabBarType = .offer
    var style: TabBarItemStyle = .normal
    var image: Image = Image(systemName: "house")
    var onSelectedImage: Image = Image(systemName: "house.fill")
    var view: AnyView
}

struct ProfileBarItem: TabBarItem {    
    var id: UUID = UUID()
    var title: String = "Profile"
    var type: TabBarType = .profile
    var style: TabBarItemStyle = .normal
    var image: Image = Image(systemName: "Pro")
    var onSelectedImage: Image = Image(systemName: "profile.fill")
    var view: AnyView
}
