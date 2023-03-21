//
//  NavigationStackView.swift
//  
//
//  Created by Marat Mikaelyan on 19.03.2023.
//

import SwiftUI

public struct NavigationStackView<Content>: View where Content: View {
    @StateObject var viewModel: NavigationStackViewModel = .init()
    private let content: Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    public var body: some View {
        ZStack {
            if viewModel.current == nil {
                content
                    .environmentObject(viewModel)
            } else {
                viewModel.current?.view
                    .environmentObject(viewModel)
            }
        }
    }
}


