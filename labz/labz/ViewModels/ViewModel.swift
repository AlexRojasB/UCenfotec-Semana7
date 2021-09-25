//
//  ViewModel.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import Foundation
class PokemonViewModel: ObservableObject {
    var page: Int = 1
    var offset: Int = 0
    let dispatchGroup = DispatchGroup()
    @Published var pokemonList: [PokemonCard] = []
    @Published var isSearching: Bool = false
    var pokemonTempList: [PokemonCard] = []
    private var pokemonTerms = ""
    
    func UpdatePokemonList(pokemonSearch: String) {
        self.isSearching = true
        if pokemonTerms != pokemonSearch {
            self.pokemonList = []
            self.pokemonTempList = []
        }
        pokemonTerms = pokemonSearch
        dispatchGroup.enter()
        getPokemonList()
        dispatchGroup.notify(queue: .main) {
            self.pokemonList = self.pokemonTempList
            self.isSearching = false
        }
    }
    
    func getPokemonList()  {
        let urlString = API.getPokemonListByName(pokemonName: pokemonTerms, page: self.page)
        NetworkManager<PokemonResponse>.fetch(for: urlString) {
            (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async { [self] in
                    
                    print("Updating pokemon list")
                    let res = response.data
                    self.page += 1
                    for pokemon in res {
                        pokemon.offset = self.offset
                        self.offset += 1
                        self.pokemonTempList.append(pokemon)
                    }
                    self.dispatchGroup.leave()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
