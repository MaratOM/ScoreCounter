//
//  ContentView.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 02.03.2023.
//

import SwiftUI
import UIDesignSystem

struct ContentView: View {
    @EnvironmentObject var store: ScoreCounterStore
    
    enum Tab {
        case games
        case players
        case navigation
    }
    
    var body: some View {
        TabView(selection: $store.tabSelection) {
            GamesScreen()
                .tag(Tab.games)
                .tabItem {
                    Label("Games", systemImage: "gamecontroller")
                }
            PlayersScreen()
                .tag(Tab.players)
                .tabItem {
                    Label("Players", systemImage: "person")
                }
            NavigationStackView() {
                VStack {
                    NavPushButton(
                        destination: ScreenTwo()
                    ) {
                        ScreenOne()
                    }
                }
            }
            .tag(Tab.navigation)
            .tabItem {
                Label("Players", systemImage: "person")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ScoreCounterStore())
    }
}

struct ScreenOne: View {
    var body: some View {
        VStack {
            Text("ScreenOne")
                .font(.title)
                .foregroundColor(.white)
            NavPushButton(destination: ScreenTwo()) {
                Text("Go to ScreenTwo")
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pink)
    }
}

struct ScreenTwo: View {
    var body: some View {
        VStack {
            Text("ScreenTwo")
                .font(.title)
                .foregroundColor(.white)
            NavPushButton(destination: ScreenThree()) {
                Text("Go to ScreenThree")
                    .foregroundColor(.white)
            }
            NavPopButton {
                Text("Go Back")
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mint)
    }
}

struct ScreenThree: View {
    var body: some View {
        VStack {
            Text("ScreenThree")
                .font(.title)
                .foregroundColor(.white)
            NavPopButton {
                Text("Go Back")
                    .foregroundColor(.white)
            }
            NavToRootButton {
                Text("Go to Root")
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.indigo)
    }
}
