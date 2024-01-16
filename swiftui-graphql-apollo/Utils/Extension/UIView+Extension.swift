//
//  UIView+Extension.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func shimmer(when isLoading: Binding<Bool>) -> some View {
        if isLoading.wrappedValue {
            self.modifier(Shimmer())
                .redacted(reason: isLoading.wrappedValue ? .placeholder : [])
        } else {
            self
        }
    }
    
    
    // MARK: - Edit
    
    @ViewBuilder
    func editMode(when isSelected: Bool, items: [ItemsTestModel], quantity: [ItemsTestModel], itemSelected: Binding<ItemsTestModel>,
                  quantitySelected: Binding<ItemsTestModel>) -> some View {
        
        self.modifier(CardEditModifier(isSelected: isSelected,
                                      items: items,
                                      quantity: quantity,
                                      itemSelected: itemSelected,
                                      quantitySelected: quantitySelected))
    }
    
    // MARK: - Navigation
    
    func addNavigationView(title: String? = nil) -> some View {
        NavigationView(content: {
            self
                .navigationTitle(title ?? "")
        })
    }
}
