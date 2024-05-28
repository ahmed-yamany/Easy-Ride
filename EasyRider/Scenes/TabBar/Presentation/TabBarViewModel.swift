//
//  TabBarViewModel.swift
//  EasyRider
//
//  Created by Mahmoud on 26/05/2024.
//

import Combine
import SwiftUI

@MainActor
protocol TabBarViewModelProtocol: ObservableObject {
    var items: [any TabBarItem] { get set }
    var selectedItem: TabBarType { get set }
    var showTabBar: Bool { get set }
    
    func viewDidLoad()
    func viweWillAppear()
    func viewDidDisAppear()
    
}

@MainActor
final class TabBarViewModel: TabBarViewModelProtocol {
    @Published var items: [any TabBarItem] = []
    @Published var selectedItem: TabBarType = .home
    @Published var showTabBar: Bool = true
    
    private var showTabBarCancellable: Cancellable?
    
    private let coordinator: TabBarCoordinatorProtocol
    private let useCase: TabBarUseCaseProtocol
    private let showTabBarPublisher: AnyPublisher<Bool, Never>
    
    init(
        coordinator: TabBarCoordinatorProtocol,
        useCase: TabBarUseCaseProtocol,
        showTabBarPublisher: AnyPublisher<Bool, Never>
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
        self.showTabBarPublisher = showTabBarPublisher
    }
    
    deinit {
        showTabBarCancellable?.cancel()
    }
    
    func viewDidLoad() {
        getItems()
        bindingShowTabBar()
    }
    
    func viweWillAppear() {
        coordinator.viewWillApear()
    }
    
    func viewDidDisAppear() {
        coordinator.viewDidDisapear()
    }
    
}
private extension TabBarViewModel {
    func getItems () {
        Task {
            do {
                items = try await useCase.getTabBarItem()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func bindingShowTabBar() {
        showTabBarCancellable = showTabBarPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.showTabBar, on: self)
    }
}
