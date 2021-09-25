//
//  labzApp.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import SwiftUI

@main
struct labzApp: App {
    @StateObject var pokemonModel = PokemonViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pokemonModel)
        }
    }
}
