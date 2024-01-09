//
//  LaunchView.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import SwiftUI
import RocketReserverAPI
import SDWebImageSwiftUI

struct LaunchView: View {
    @ObservedObject var viewModel = LaunchViewModel()
    
    var body: some View {
        NavigationStack {
            content()
                .onAppear {
                    viewModel.fetchRockets()
                }
                .navigationTitle(LocaleKeys.title.localized)
        }
    }
    
    // MARK: - Content
    
    @ViewBuilder
    private func content() -> some View {
        VStack {
            Toggle(LocaleKeys.skeletonComponent.localized,
                   isOn: $viewModel.loading)
            .padding()
            
            launchList()
        }
    }
    
    // MARK: - Launch List
    
    private func launchList() -> some View {
        List(viewModel.launches, id: \.id) { launch in
            NavigationLink(destination: LaunchDetails(launch: launch)) {
                LaunchRow(launch: launch, loading: $viewModel.loading)
                    .shimmering($viewModel.loading)
            }
            .disabled(viewModel.loading)
        }
    }
}

#Preview {
    LaunchView()
}
