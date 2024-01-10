//
//  ItemRow.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SwiftUI

struct ItemRow: View {
    private let placeholderImg = Image(systemName: "gear")
    
    let item: CharactersListModel
    @Binding var loading: Bool
    
    var body: some View {
        HStack {
            if let url = URL(string: item.image ?? "") {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    EmptyView()
                        .shimmering(.constant(true))
                }
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(item.name ?? "")
                    .font(.title2)
                    .tint(.black)
                HStack {
                    Text("\(item.status ?? "") -")
                        .font(.footnote)
                        .tint(.black.opacity(0.7))
                    
                    Text(item.species ?? "")
                        .font(.footnote)
                        .tint(.black.opacity(0.7))
                }
                
                Text(item.species ?? "")
                    .font(.system(size: 14))
                    .tint(.black.opacity(0.7))
                Spacer()
            }
            .padding(.top)
            
            Spacer()
        }
        .frame(height: 100)
    }
}

#Preview {
    ItemRow(item: CharactersListModel(id: "1", name: "Rick", status: "dead", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/218.jpeg", location: ""), loading: .constant(true))
}
