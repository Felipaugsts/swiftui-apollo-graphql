//
//  CharacterDetailModel.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation

struct Location {
    var id: String
    var name: String
    var dimension: String
    var residents: [CharactersListModel]
}

struct Episode {
    var id: String
    var name: String
}
