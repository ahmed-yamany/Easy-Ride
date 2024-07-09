//
//  HomeVIew.swift
//  EasyRider
//
//  Created by Mahmoud on 09/07/2024.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("Hello, World!")
    }
}

//struct HomeVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
