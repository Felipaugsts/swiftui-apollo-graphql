//
//  HomeView.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 12/01/24.
//

import SwiftUI

struct HomeViewModel: Hashable {
    var id: Int
    var title: String
}

struct HomeView: View {
    var options: [HomeViewModel] = [HomeViewModel(id: 0, title: "GraphQL Fetch - Skeleton"),
                                    HomeViewModel(id: 1, title: "Button Inheritance")]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(options, id: \.id) { option in
                        NavigationLink(value: option) {
                            Text(option.title)
                        }
                    }
                }
                .listStyle(.insetGrouped)
                
            }
            .navigationTitle("Home View")
            .navigationDestination(for: HomeViewModel.self) { option in
                if option.id == 0 {
                    CharacterView()
                } else {
                    ModifierList()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
