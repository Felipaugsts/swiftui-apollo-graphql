//
//  LocaleKeys.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation

enum LocaleKeys: String {
    case title = "titleView"
    case skeletonComponent = "skeletonComponent"
}

extension LocaleKeys {
    var localized: String {
        return self.rawValue.localized()
    }
}
