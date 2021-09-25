//
//  ContentView.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @EnvironmentObject var model: PokemonViewModel
    var body: some View {
        VStack {
            HStack {
                TextField(
                       "Search by pokemon name",
                       text: $username
                   ) { isEditing in
                   } onCommit: {
                       model.UpdatePokemonList(pokemonSearch: username)
                   }
                   .autocapitalization(.none)
                   .disableAutocorrection(true)
               .border(Color(UIColor.separator))
                
            }
            ScrollView {
                LazyVStack {
                    ForEach(model.pokemonList, id: \.self) { pokemon in
                        VStack {
                            PokemonView(pokemonUrl: pokemon.images.large, pokemonName: pokemon.name)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
