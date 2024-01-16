//
//  ModifierList.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 12/01/24.
//

import SwiftUI

struct ModifierList: View {
    @State var selectedItems: Int = 99
    @State var selectedSize: Int = 99
    
    @State var itemSelected: ItemsTestModel = ItemsTestModel(id: 2, name: "Whole", image: "circle.inset.filled")
    @State var quantitySelected: ItemsTestModel = ItemsTestModel(id: 1, name: "Normal")
    
    var availableItemsItems: [ItemsTestModel] = [ItemsTestModel(id: 0, name: "Peperoni", image: "pizza"),
                                                 ItemsTestModel(id: 1, name: "Mushroom", image: "pizza"),
                                                 ItemsTestModel(id: 2, name: "Pepper", image: "pizza")]
    
    var whereTo: [ItemsTestModel] = [ItemsTestModel(id: 0, name: "Left", image: "circle.lefthalf.filled"),
                                     ItemsTestModel(id: 1, name: "Right", image: "circle.righthalf.filled"),
                                     ItemsTestModel(id: 2, name: "Whole", image: "circle.inset.filled")]
    
    var availableItemsSize: [ItemsTestModel] = [ItemsTestModel(id: 0, name: "Small", sub: "10"),
                                                ItemsTestModel(id: 1, name: "Medium", sub: "12"),
                                                ItemsTestModel(id: 2, name: "Large", sub: "14"),
                                                ItemsTestModel(id: 3, name: "X-Large", sub: "16")]
    
    var quantity: [ItemsTestModel] = [ItemsTestModel(id: 0, name: "Light"),
                                      ItemsTestModel(id: 1, name: "Normal"),
                                      ItemsTestModel(id: 2, name: "Extra")]
    
    var body: some View {
        
        VStack (alignment: .leading) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(availableItemsSize) { item in
                            CardSelected(selectedItems: $selectedSize, 
                                         item: item,
                                         selected: $selectedSize.wrappedValue == item.id)
                                .frame(width: 130, height: 200)
                            
                        }
                    }
                }
                .scrollIndicators(.hidden)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(availableItemsItems) { item in
                        CardSelected(selectedItems: $selectedItems, 
                                     item: item,
                                     selected: $selectedItems.wrappedValue == item.id)
                            .editMode(when: selectedItems == item.id,
                                      items: whereTo,
                                      quantity: quantity,
                                      itemSelected: $itemSelected,
                                      quantitySelected: $quantitySelected)
                            .frame(width: 200, height: 200)
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        
        Spacer()
    }
}

#Preview {
    ModifierList()
}

