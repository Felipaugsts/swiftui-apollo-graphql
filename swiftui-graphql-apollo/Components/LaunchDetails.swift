//
//  LaunchDetails.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SDWebImageSwiftUI
import SwiftUI

struct LaunchDetails: View {
    let launch: LaunchModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                if let missionPatch = launch.mission?.missionPatch {
                    WebImage(url: URL(string: missionPatch))
                        .resizable()
                        .indicator(.activity)
                        .scaledToFit()
                }
                Spacer()
            }
            .frame(height: 100, alignment: .top)
            
            Text(launch.mission?.name ?? "")
                .font(.title)
            Spacer()
        }
    }
}
    
