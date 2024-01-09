//
//  Network.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import Apollo
import RocketReserverAPI

// MARK: Static

enum launchUrls {
    static var base = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")
}
// MARK: - Protocol

protocol NetworkService {
    func fetchLaunches(completion: @escaping (Result<GraphQLResult<LaunchListQuery.Data>?, Error>) -> Void)
}

class Network: NetworkService {
    static let shared: NetworkService = Network()
    private(set) var apollo: ApolloClient?
    
    // MARK: - Initializers
    
    init() {
        guard let url = launchUrls.base else { return }
        
        apollo = ApolloClient(url: url)
    }
    
    // MARK: - Public Methods
    
    public func fetchLaunches(completion: @escaping (Result<GraphQLResult<LaunchListQuery.Data>?, Error>) -> Void) {
        apollo?.fetch(query: LaunchListQuery()) { result in
            completion(result.map { Optional.some($0) })
        }
    }
}
