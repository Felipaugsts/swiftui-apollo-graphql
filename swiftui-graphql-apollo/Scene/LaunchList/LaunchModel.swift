//
//  LaunchModel.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation

struct LaunchModel: Codable, Hashable {
    let id: String
    let site: String?
    let mission: Mission?

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(site)
        hasher.combine(mission)
    }

    static func == (lhs: LaunchModel, rhs: LaunchModel) -> Bool {
        return lhs.id == rhs.id &&
               lhs.site == rhs.site &&
               lhs.mission == rhs.mission
    }
}

struct Mission: Codable, Hashable {
    let name: String
    let missionPatch: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case missionPatch = "missionPatch"
    }
}

