//
//  CharacterView.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import SwiftUI
import RocketReserverAPI

struct CharacterView: View {
    @ObservedObject var viewModel = CharacterViewModel()
    @Namespace var animation
    
    var body: some View {
        NavigationStack {
            content()
                .onAppear {
                    viewModel.fetchCharacters()
                }
                .navigationDestination(for: CharactersListModel.self) { character in
                    DetailsView(item: character)
                }
        }
    }
    
    // MARK: - Content
    
    @ViewBuilder
    private func content() -> some View {
        VStack {
            Toggle(LocaleKeys.skeletonComponent.localized,
                   isOn: $viewModel.loading)
            .padding()
            
            charactersList()
        }
    }
    
    // MARK: - List
    
    private func charactersList() -> some View {
        ScrollView {
            LazyVStack(spacing: 4) {
                ForEach(viewModel.charactersList, id: \.id) { character in
                    NavigationLink(value: character, label: {
                        ItemRow(item: character,
                                loading: $viewModel.loading)
                        .shimmering($viewModel.loading)
                    })
                    .disabled(viewModel.loading)
                }
            }
        }
    }
    
}

#Preview {
    CharacterView()
}
