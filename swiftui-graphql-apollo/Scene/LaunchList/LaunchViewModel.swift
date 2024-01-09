//
//  LaunchViewModel.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SwiftUI
import RocketReserverAPI

class LaunchViewModel: ObservableObject {
    @Published var launches = [LaunchModel]()
    @Published var loading: Bool = false
    
    private let service: NetworkService
    
    // MARK: - Initializer
    
    init(service: NetworkService = Network.shared) {
        self.service = service
    }
    
    // MARK: - Public Methods
    
    public func fetchRockets() {
        if launches.isEmpty {
            displayLoaderPlaceholders()
        }
        loading = true
        
        service.fetchLaunches { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                if let response = success?.data?.launches {
                    let launches: [LaunchModel] = response.launches.compactMap { index in
                        guard let id = index?.id else { return nil }
                        return LaunchModel(id: id, site: index?.site, mission: Mission(name: index?.mission?.name ?? "",
                                                                                       missionPatch: index?.mission?.missionPatch))
                    }
                    self.launches = launches
                    self.loading = false
                }
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func displayLoaderPlaceholders() {
        let loaderPlaceholders: [LaunchModel] = (0..<6).map { index in
            LaunchModel(id: String(index), site: nil, mission: nil)
        }
        launches = loaderPlaceholders
    }
}
