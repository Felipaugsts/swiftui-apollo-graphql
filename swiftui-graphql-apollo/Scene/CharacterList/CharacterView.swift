//
//  CharacterView.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import SwiftUI

struct CharacterView: View {
    @ObservedObject var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationView {
            content()
                .onAppear {
                    viewModel.fetchCharacters()
                }
                .navigationTitle(LocaleKeys.title.localized)
                .navigationBarItems(trailing: {
                    Toggle(LocaleKeys.skeletonComponent.localized,
                           isOn: $viewModel.loading)
                }())
                .padding()
        }
    }
    
    // MARK: - Content
    
    @ViewBuilder
    private func content() -> some View {
        VStack() {
            Text(LocaleKeys.titleView.localized)
                .shimmering($viewModel.loading)
            
            List {
                ForEach(viewModel.filteredFruits, id: \.id) { character in
                    NavigationLink(destination: CharacterDetailView(item: character)) {
                        ItemRow(item: character, loading: $viewModel.loading)
                            .shimmering($viewModel.loading)
                    }
                }
            }
            .listStyle(.inset)
            .searchable(text: $viewModel.searchText, prompt: LocaleKeys.textfieldPlaceholder.localized)
            .disabled(viewModel.loading)
        }
    }
}

#Preview {
    CharacterView()
}
