//
//  HomeVIew.swift
//  EasyRider
//
//  Created by Mahmoud on 09/07/2024.
//

import SwiftUI
import MapKit

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
                
        }
        
    }
}
