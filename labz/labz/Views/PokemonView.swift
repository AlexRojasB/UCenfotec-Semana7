//
//  PokemonView.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import SwiftUI

struct PokemonView: View {
    var pokemonUrl: String
    var pokemonName: String
    var body: some View {
        VStack {
            if let bannerURL = URL(string: pokemonUrl) {
                Image(systemName: "square.fill").data(url: bannerURL)
                    .resizable()
                    .frame(width: 250, height: 400, alignment: .center)
            }
            Text(pokemonName)
                .font(.title2)
                .fontWeight(.heavy)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemonUrl: "https://images.pokemontcg.io/base4/4_hires.png", pokemonName: "Charizard")
    }
}
