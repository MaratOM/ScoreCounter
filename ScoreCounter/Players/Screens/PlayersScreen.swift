//
//  PlayersScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 03.03.2023.
//

import SwiftUI

struct PlayersScreen: View {
    @State private var players: [Player] = [
        .init(id: UUID().uuidString, name: "John", avatar: "😎"),
        .init(id: UUID().uuidString, name: "Paul", avatar: "🤩"),
        .init(id: UUID().uuidString, name: "George", avatar: "😵‍💫"),
        .init(id: UUID().uuidString, name: "Ringo", avatar: "🥸"),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(players) { player in
                            NavigationLink {
                                PlayerScreen(player: player)
                            } label: {
                                PlayerView(player: player)
                            }
                        }
                    }
                }
                
                NavigationLink {
                    AddPlayerScreen()
                } label: {
                    Label("text", systemImage: "plus.circle")
                        .font(.system(size: 50))
                        .foregroundColor(.black)
                        .labelStyle(.iconOnly)
                        .padding([.bottom], 10)
                }
            }
            .navigationTitle("Players")
        }
    }
}

struct PlayersScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayersScreen()
    }
}
