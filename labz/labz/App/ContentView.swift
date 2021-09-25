//
//  ContentView.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import SwiftUI

struct ContentView: View {
    @State var pokemonName: String = ""
    @EnvironmentObject var model: PokemonViewModel
    @State var firstSearch: Bool = false
    var body: some View {
        VStack {
            HStack {
                TextField(
                    "Search by pokemon name",
                    text: $pokemonName
                ) { isEditing in
                } onCommit: {
                    firstSearch = true
                    model.UpdatePokemonList(pokemonSearch: pokemonName)
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
                
            }
            ScrollView {
                
                ZStack {
                    if model.isSearching {
                        LoadingView()
                            .padding()
                    }
                    LazyVStack {
                        if model.pokemonList.count > 0 {
                            
                            ForEach(model.pokemonList, id: \.self) { pokemon in
                                VStack {
                                    PokemonView(pokemonUrl: pokemon.images.small, pokemonName: pokemon.name)
                                }.onAppear {
                                    if pokemon.offset == (model.offset - 5) {
                                        model.UpdatePokemonList(pokemonSearch: pokemonName)
                                    }
                                }
                            }
                            
                        }
                        else if !model.isSearching && firstSearch {
                            EmptyPokemon()
                        } else if !model.isSearching {
                            Text("Go and catch some pokemons dear trainer!")
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
