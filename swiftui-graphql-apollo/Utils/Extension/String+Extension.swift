//
//  String+Extension.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation

import Foundation
import SwiftUI

extension String {
    func localized() -> String {
        guard let path = Bundle.main.path(forResource: "en", ofType: "lproj"),
            let bundle = Bundle(path: path) else {
            return NSLocalizedString(self, comment: "")
        }
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
    
    var settings: String {
        return "settings"
    }
}
