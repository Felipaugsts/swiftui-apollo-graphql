//
//  LaunchRow.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct LaunchRow: View {
    private let placeholderImg = Image(systemName: "gear")
    
    let launch: LaunchModel
    @Binding var loading: Bool
    
    var body: some View {
        HStack {
            if let missionPatch = launch.mission?.missionPatch {
                WebImage(url: URL(string: missionPatch))
                    .resizable()
                    .placeholder(placeholderImg)
                    .indicator(.activity)
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            } else {
                placeholderImg
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(launch.mission?.name ?? "Mission Name")
                Text(launch.site ?? "Launch Site")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .padding(4)
    }
}
