//
//  CharacterDetailViewModel.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SwiftUI
import CharactersAPI

class CharacterDetailViewModel: ObservableObject {
    
    @Published var planets: Location?
    @Published var expanded: Bool = false
    @Published var episodeExpended: Bool = false
    @Published var episodes: [Episode] = []
    
    @Published var loadingPlanets: Bool = false
    @Published var loadingEpisodes: Bool = false
    
    private let service: NetworkService
    
    // MARK: - Initializer
    
    init(service: NetworkService = Network.shared) {
        self.service = service
    }
    
    public func fetchPlanet(id: String) {
        loadingPlanets = true
        
        service.fetchLocation(id) { result in
            switch result {
            case .success(let resp):
                if let response = resp?.data?.location {
                    self.planets = Location(id: response.id ?? "",
                                            name: response.name ?? "",
                                            dimension: response.dimension ?? "",
                                            residents: self.fetchResidents(response))
                    self.loadingPlanets = false
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    public func fetchEpisodes(name: String) {
        loadingEpisodes = true
        
        service.fetchEpisodeBy(name) { results in
            switch results {
            case .success(let resp):
                if let response = resp?.data?.characters?.results {
                    _ = response.map { result in
                        result?.episode.first?.map({ episode in
                            self.episodes.append(Episode(id: episode.id ?? "", name: episode.name ?? ""))
                        })
                    }
                }
                self.loadingEpisodes = false
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func fetchResidents(_ data: PlanetsQuery.Data.Location) -> [CharactersListModel] {
        let response: [CharactersListModel] = data.residents.map { resident in
            return CharactersListModel(id: resident?.id ?? "", name: resident?.name ?? "", status: resident?.status ?? "", species: resident?.species, image: resident?.image ?? "", location: data.id ?? "")
        }
        
        return response
    }
}
