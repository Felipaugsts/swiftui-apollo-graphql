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
    @Published var filter: String = ""
    
    private let service: NetworkService
    
    // MARK: - Initializer
    
    init(service: NetworkService = Network.shared) {
        self.service = service
    }
    
    // MARK: - Public Methods
    
    public func fetchCharacters() {
        loading = true
        
        if charactersList.isEmpty {
            displayLoaderPlaceholders()
        }
        
        service.fetchCharacters { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                if let response = success?.data?.characters?.results {
                    self.populateCharacterList(response)
                    return
                }
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func displayLoaderPlaceholders() {
        let loaderPlaceholders: [CharactersListModel] = (0..<6).map { index in
            CharactersListModel(id: String(index), name: nil, status: nil, species: nil, image: nil)
        }
        charactersList = loaderPlaceholders
    }
    
    private func populateCharacterList(_ characters: [CharactersListQuery.Data.Characters.Result?]) {
        let items: [CharactersListModel] = characters.compactMap { index in
            return CharactersListModel(id: index?.id ?? "",
                                       name: index?.name,
                                       status: index?.status,
                                       species: index?.species,
                                       image: index?.image)
        }
        
        charactersList = items
        loading = false
    }
}
