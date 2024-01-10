//
//  CharacterDetailView.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SwiftUI

struct CharacterDetailView: View {
    let item: CharactersListModel
    @StateObject var viewModel = CharacterDetailViewModel()
    
    var body: some View {
        VStack {
            characterImage()
            characterDetails()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchPlanet(id: item.location ?? "")
            viewModel.fetchEpisodes(name: item.name)
        }
    }
    
    private func characterImage() -> some View {
        if let url = URL(string: item.image ?? "") {
            return AnyView(
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    EmptyView()
                        .shimmering(.constant(true))
                }
                .frame(maxWidth: .infinity)
                .ignoresSafeArea(edges: .top)
            )
        } else {
            return AnyView(EmptyView())
        }
    }
    
    private func characterDetails() -> some View {
        VStack {
            Text(item.name)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("Status: \(item.status ?? "")")
                .font(.headline)
            
            planetsAndEpisodesSection()
        }
        .listStyle(.grouped)
    }
    
    private func planetsAndEpisodesSection() -> some View {
        List {
            Section(header: Text("Planet - \(viewModel.planets?.name ?? "")"),
                    footer: EmptyView().padding(.top, 8)) {
                residentsDisclosureGroup()
                episodesDisclosureGroup()
            }
            .font(.subheadline)
        }
    }
    
    private func residentsDisclosureGroup() -> some View {
        DisclosureGroup("Residents", isExpanded: $viewModel.expanded) {
            if let residents = viewModel.planets?.residents {
                ForEach(residents, id: \.id) { resident in
                    NavigationLink(destination: CharacterDetailView(item: resident)) {
                        Text(resident.name)
                    }
                }
            } else {
                Text("No residents found")
            }
        }
        .shimmering($viewModel.loadingPlanets)
    }
    
    private func episodesDisclosureGroup() -> some View {
        DisclosureGroup("Episodes", isExpanded: $viewModel.episodeExpended) {
            ForEach(viewModel.episodes, id: \.id) { episode in
                Text(episode.name)
            }
        }
        .shimmering($viewModel.loadingEpisodes)
    }
}

#Preview {
    CharacterDetailView(item: CharactersListModel(id: "1", name: "Rick", status: "dead", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/218.jpeg", location: "1"))
}
