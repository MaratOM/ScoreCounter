//
//  ScoreCounterApp.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 02.03.2023.
//

import SwiftUI

@main
struct ScoreCounterApp: App {
    @StateObject private var store = ScoreCounterStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
