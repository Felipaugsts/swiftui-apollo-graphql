//
//  DetailsView.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SwiftUI

struct CharacterDetailView: View {
    let item: CharactersListModel
    @ObservedObject var viewModel = CharacterDetailViewModel()
    
    var body: some View {
        VStack() {
            if let url = URL(string: item.image ?? "") {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                } placeholder: {
                    EmptyView()
                        .shimmering(.constant(true))
                }
                .frame(maxWidth: .infinity)
                .ignoresSafeArea(edges: .top)
            }
            Text(item.name ?? "")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("Status: \(item.status ?? "")")
                .font(.headline)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}




#Preview {
    CharacterDetailView(item: CharactersListModel(id: "1", name: "Rick", status: "dead", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/218.jpeg", location: "1"))
}
