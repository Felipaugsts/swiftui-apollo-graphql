//
//  CharactersListModel.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation

struct CharactersListModel: Codable, Hashable {
    let id: String
    let name: String
    let status: String?
    let species: String?
    let image: String?
    let location: String?
}
