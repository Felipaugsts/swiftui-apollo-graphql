//
//  CardSelected.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 12/01/24.
//

import Foundation
import SwiftUI

struct ItemsTestModel: Identifiable, Hashable {
    var id: Int
    var name: String
    var sub: String? = nil
    var image: String? = nil
}

struct CardSelected: View {
    @Binding var selectedItems: Int
    var item: ItemsTestModel
    var selected: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text(item.name)
                        .foregroundColor(.black.opacity(0.6))
                        .fontWeight(.bold)
                    
                    if let subtitle = item.sub {
                        Text("\(subtitle) ''")
                            .foregroundColor(.black.opacity(0.5))
                            .fontWeight(.light)
                    }
                }
                
                Spacer()
                
                Image(systemName: selected ? "record.circle" : "circle")
                    .foregroundColor(selected ? Color.blue.opacity(0.9) : .black.opacity(0.6))
                    .tint(.black)
            }
            
            if let imageStr = item.image {
                Spacer()
                Image(imageStr)
                    .resizable()
            }
        }
        .padding()
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(selected ? Color.blue.opacity(0.9) : Color.black.opacity(0.6), lineWidth: 3))
        .cornerRadius(16)
        .onTapGesture {
            selectedItems = item.id
        }
    }
}


//
//#Preview {
//        CardSelected(selectedItems: .constant(1), item: ItemsTestModel(id: 1, name: "Medium"))
//        .editMode(when: true, items: [ItemsTestModel(id: 1, name: "test", image: "")], quantity: [])
//        .frame(width: 200, height: 200)
//        
//}
