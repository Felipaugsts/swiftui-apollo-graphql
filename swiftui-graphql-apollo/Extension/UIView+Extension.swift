//
//  UIView+Extension.swift
//  swiftui-graphql-apollo
//
//  Created by Felipe Augusto Silva on 09/01/24.
//

import Foundation
import SwiftUI

public struct Shimmer: ViewModifier {
    @State private var isInitialState = true
    @Environment(\.layoutDirection) private var layoutDirection

    public func body(content: Content) -> some View {
        content
            .mask(
                LinearGradient(
                    gradient: .init(colors: [.black.opacity(0.3), .black, .black.opacity(0.3)]),
                    startPoint: layoutDirection == .rightToLeft ? (isInitialState ? .init(x: 1.3, y: -0.3) : .init(x: 0, y: 1)) :
                                                                  (isInitialState ? .init(x: -0.3, y: -0.3) : .init(x: 1, y: 1)),
                    endPoint: layoutDirection == .rightToLeft ? (isInitialState ? .init(x: 1, y: 0) : .init(x: -0.3, y: 1.3)) :
                                                                  (isInitialState ? .init(x: 0, y: 0) : .init(x: 1.3, y: 1.3))
                )
            )
            .animation(.linear(duration: 1.5).delay(0.25).repeatForever(autoreverses: false), value: isInitialState)
            .onAppear {
                isInitialState = false
            }
    }
}


public extension View {
    @ViewBuilder func shimmering(_ isLoading: Binding<Bool>) -> some View {
        if isLoading.wrappedValue {
            self.modifier(Shimmer())
                .redacted(reason: isLoading.wrappedValue ? .placeholder : [])
        } else {
            self
        }
    }
}
