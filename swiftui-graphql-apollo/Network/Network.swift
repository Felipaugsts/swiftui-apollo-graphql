//
//  Network.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import Apollo
import CharactersAPI

// MARK: Static

enum Urls {
    static var base = URL(string: "https://rickandmortyapi.com/graphql")
}
// MARK: - Protocol

protocol NetworkService {
    func fetchCharacters(completion: @escaping (Result<GraphQLResult<CharactersListQuery.Data>?, Error>) -> Void)
    func fetchLocation(_ id: String, completion: @escaping (Result<GraphQLResult<PlanetsQuery.Data>?, Error>) -> Void)
    func fetchEpisodeBy(_ name: String, completion: @escaping (Result<GraphQLResult<CharactersByFilterQuery.Data>?, Error>) -> Void)
}

class Network: NetworkService {
    static let shared: NetworkService = Network()
    private(set) var apollo: ApolloClient?
    
    // MARK: - Initializers
    
    init() {
        guard let url = Urls.base else { return }
        
        apollo = ApolloClient(url: url)
    }
    
    // MARK: - Public Methods
    
    public func fetchCharacters(completion: @escaping (Result<GraphQLResult<CharactersListQuery.Data>?, Error>) -> Void) {
        apollo?.fetch(query: CharactersListQuery()) { result in
            completion(result.map { Optional.some($0) })
        }
    }
    
    public func fetchLocation(_ id: String, completion: @escaping (Result<GraphQLResult<PlanetsQuery.Data>?, Error>) -> Void) {
        apollo?.fetch(query: PlanetsQuery(id: id)) { result in
            completion(result.map { Optional.some($0) })
        }
    }
    
    public func fetchEpisodeBy(_ name: String, completion: @escaping (Result<GraphQLResult<CharactersByFilterQuery.Data>?, Error>) -> Void) {
        apollo?.fetch(query: CharactersByFilterQuery(name: name)) { result in
            completion(result.map { Optional.some($0) })
        }
    }
}
