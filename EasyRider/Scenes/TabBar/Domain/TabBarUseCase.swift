//
//  TabBarUseCase.swift
//  EasyRider
//
//  Created by Mahmoud on 25/05/2024.
//

import Foundation

protocol TabBarUseCaseProtocol {
    func getTabBarItem() async -> [any TabBarItem]
}

class TabBarUseCase: TabBarUseCaseProtocol {
    
    private let tabBarItemsFactory: TabBarItemFactory
    
    init(tabBarItemsFactory: TabBarItemFactory) {
        self.tabBarItemsFactory = tabBarItemsFactory
    }
    
    func getTabBarItem() async -> [any TabBarItem] {
        var items: [any TabBarItem] = []
    
        for type in TabBarType.allCases {
            items.append(await tabBarItemsFactory.make(for: type))
        }
        return items
    }
    
}
