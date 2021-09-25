//
//  ViewModel.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import Foundation
class PokemonViewModel: ObservableObject {
    var offset = 1
    let dispatchGroup = DispatchGroup()
    @Published var pokemonList: [PokemonCard] = []
    var pokemonTempList: [PokemonCard] = []
    private var pokemonTerms = ""
    
    func UpdatePokemonList(pokemonSearch: String) {
        pokemonTerms = pokemonSearch
        dispatchGroup.enter()
        getPokemonList()
        dispatchGroup.notify(queue: .main) {
            self.pokemonList = self.pokemonTempList
        }
    }
    
    func getPokemonList()  {
        let urlString = API.getPokemonListByName(pokemonName: pokemonTerms, page: offset)
        NetworkManager<PokemonResponse>.fetch(for: urlString) {
            (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    print("Updating pokemon list")
                    let res = response.data
                    self.offset += 1
                    for pokemon in res {
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
