//
//  CharacterViewModel.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SwiftUI
import CharactersAPI

class CharacterViewModel: ObservableObject {
    
    @Published var charactersList = [CharactersListModel]()
    @Published var loading: Bool = false
    @Published var searchText: String = ""
    
    lazy var charactersListMocked: [CharactersListModel] = { loadMock() }()
    var filteredFruits: [CharactersListModel] {
        charactersList.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    private let service: NetworkService
    
    // MARK: - Initializer
    
    init(service: NetworkService = Network.shared) {
        self.service = service
    }
    
    // MARK: - Public Methods
    
    public func fetchCharacters() {
        loading = true
        service.fetchCharacters { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                if let response = response?.data?.characters?.results {
                    self.populateCharacterList(response)
                    loading = false
                    return
                }
                
            case .failure(let failure):
                print(failure)
                loading = false
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func loadMock() -> [CharactersListModel] {
        let loaderPlaceholders = (0..<2).map { index in
            CharactersListModel(id: String(index),
                                name: "loading",
                                status: "loading",
                                species: "loading",
                                image: "loading",
                                location: "loading")
        }
        return loaderPlaceholders.compactMap { $0 }
    }
    
    private func populateCharacterList(_ characters: [CharactersListQuery.Data.Characters.Result?]) {
        let items: [CharactersListModel] = characters.compactMap { index in
            return CharactersListModel(id: index?.id ?? "",
                                       name: index?.name ?? "",
                                       status: index?.status,
                                       species: index?.species,
                                       image: index?.image,
                                       location: index?.location?.id)
        }
        
        charactersList = items
    }
}
