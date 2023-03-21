//
//  NavigationStackViewModel.swift
//  
//
//  Created by Marat Mikaelyan on 19.03.2023.
//

import SwiftUI

final public class NavigationStackViewModel: ObservableObject {
    @Published var current: Screen?
    private var screenStack = ScreenStack() {
        didSet {
            current = screenStack.top()
        }
    }
    
    func push<V: View>(_ view: V) {
        screenStack.push(screen: .init(id: UUID(), view: AnyView(view)))
    }
    
    func pop(to destination: NavigationPopType) {
        switch destination {
        case .previous:
            screenStack.pop()
        case .root:
            screenStack.popToRoot()
        }
    }
}
