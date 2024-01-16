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
        content()
            .addNavigationView()
            .onAppear {
                viewModel.fetchCharacters()
            }
            .navigationBarItems(trailing: {
                Toggle(LocaleKeys.skeletonComponent.localized,
                       isOn: $viewModel.loading)
            }())
    }
    
    // MARK: - Content
    
    @ViewBuilder
    private func content() -> some View {
        VStack() {
            Text(LocaleKeys.titleView.localized)
            
            List {
                ForEach($viewModel.loading.wrappedValue ? viewModel.charactersListMocked : viewModel.filteredFruits, id: \.id) { character in
                    NavigationLink(destination: CharacterDetailView(item: character)) {
                        ItemRow(item: character)
                            .shimmer(when: $viewModel.loading)
                    }
                }
            }
            .listStyle(.inset)
            .searchable(text: $viewModel.searchText, prompt: $viewModel.loading.wrappedValue ? "" : LocaleKeys.textfieldPlaceholder.localized)
            .disabled(viewModel.loading)
            .refreshable {
                viewModel.loading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewModel.fetchCharacters()
                }
            }
        }
    }
}

#Preview {
    CharacterView()
}
