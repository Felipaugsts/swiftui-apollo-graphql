//
//  BaseButton.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 12/01/24.
//

import SwiftUI

struct BaseButton<Label: View>: View {
    var background: Color
    @Binding var loading: Bool
    
    var action: () -> Void
    var label: () -> Label
    
    var body: some View {
        Button(action: {
            action()
        }) {
            if loading {
                ProgressView()
            } else {
                label()
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 7)
        .background(background)
        .cornerRadius(6)
    }
}

#Preview {
    BaseButton(background: .red, loading: .constant(false)) {
        print("tap")
    } label: {
        Text("test")
    }

}
