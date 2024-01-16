//
//  CardEditModifier.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 16/01/24.
//

import Foundation
import SwiftUI

struct CardEditModifier: ViewModifier {
    
    var isSelected: Bool
    var items: [ItemsTestModel]
    var quantity: [ItemsTestModel]
    @Binding var itemSelected: ItemsTestModel
    @Binding var quantitySelected: ItemsTestModel
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            
            if isSelected {
                VStack {
                    Spacer()
                    HStack {
                        HStack {
                            Text("\(itemSelected.name) ,")
                                .foregroundStyle(.white)
                                .font(.footnote)
                            
                            Text(quantitySelected.name)
                                .foregroundStyle(.white)
                                .font(.footnote)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        Menu {
                            quantityPicker
                            itemsPicker
                            
                        } label: {
                            Image(systemName: "pencil.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.white)
                            
                        }
                        .menuOrder(.priority)
                    }
                    .padding()
                    .padding(.horizontal, 5)
                    .padding(.top, 5)
                    .background(Color.blue)
                }
                .border(Color.blue, width: 8)
                .cornerRadius(16)
            }
        }
    }
    
    // MARK: - Quantity
    
    var quantityPicker: some View {
        Picker("", selection: $quantitySelected) {
            ForEach(quantity, id: \.id) { item in
                VStack {
                    Text(item.name)
                }
                .tag(item)
            }
        }
    }
    
    // MARK: - Item Picker
    
    var itemsPicker: some View {
        Picker("", selection: $itemSelected) {
            ForEach(items, id: \.id) { item in
                VStack {
                    Image(systemName: item.image ?? "circle.inset.filled")
                    Text(item.name)
                }
                .tag(item)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
